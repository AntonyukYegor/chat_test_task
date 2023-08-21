import 'dart:async';
import 'dart:convert';

import 'package:chat_test_task/common/models/web_socket_create_menu_response.dart';
import 'package:chat_test_task/common/models/web_socket_create_message_response.dart';
import 'package:chat_test_task/presentation/features/chat/models/incoming_message.dart';
import 'package:chat_test_task/presentation/features/chat/models/menu_message.dart';
import 'package:chat_test_task/presentation/features/chat/models/message.dart';
import 'package:chat_test_task/presentation/features/chat/models/outgoing_message.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageRepository {
  late WebSocketChannel channel;
  final StreamController<Message> _streamController =
      StreamController.broadcast();

  void sendMessage({required String message}) {
    channel.sink.add(
        ''' { "action" : "send_message", "client_message_id" : "b1bc5a9a-9552-4855-a9a9-4a91c8e56763", "chat_id" : "2bf2bd70-8785-4735-91af-2edfb9021672", "text": "$message" }''');
    _streamController.add(OutgoingMessage(content: message));
  }

  void close() {
    _streamController.sink.close();
  }

  void _restart() {
    init();
  }

  void init() {
    final wsUrl = Uri.parse('ws://212.41.9.88:83');
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      final currentMessage = message;

      if (currentMessage == 'AUTH_ERR') {
        _restart();
      }

      if (currentMessage == '{"action": "ping"}' ||
          currentMessage == 'AUTH_OK') {
        return;
      }

      if (message == 'AUTH') {
        channel.sink.add('AUTH testtoken');
        return;
      }

      final decodedResponse = const JsonDecoder().convert(message);

      if (decodedResponse is List) {
        return;
      }

      Map<String, dynamic> mapResponse = decodedResponse;

      if (mapResponse['action'] == 'create_message') {
        final WebSocketCreateMessageResponse response =
            WebSocketCreateMessageResponse.fromJson(
          const JsonDecoder().convert(message),
        );
        _streamController.add(IncomingMessage(
          content: response.text,
          postfix: DateFormat.Hm().format(DateTime.parse(
            response.creationTime,
          )),
        ));

        return;
      }

      if (mapResponse['action'] == 'create_menu') {
        final WebSocketCreateMenuResponse response =
            WebSocketCreateMenuResponse.fromJson(
          const JsonDecoder().convert(message),
        );
        if (response.menu.isNotEmpty == true) {
          _streamController.add(MenuMessage(
            items: response.menu
                .map((e) => MenuMessageItem(
                    title: e.title,
                    call: () {
                      channel.sink.add(
                          '''{"action":"force_menu", "chat_id": "2bf2bd70-8785-4735-91af-2edfb9021672" ,"menu_id":"${response.id}","value_id":"${e.id}"}''');
                    }))
                .toList(),
            content: 'Варианты:',
          ));

          return;
        }
      }

      if (mapResponse['action'] == 'error_message') {
        _restart();
      }
    });

    channel.sink.add('AUTH testtoken');
  }

  Stream<Message> get stream => _streamController.stream;
}
