import 'package:chat_test_task/presentation/features/chat/models/incoming_message.dart';
import 'package:chat_test_task/presentation/features/chat/models/message.dart';
import 'package:chat_test_task/presentation/features/chat/models/outgoing_message.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/chat_app_bar.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/chat_message_list.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VirtualAssistantChatPage extends StatefulWidget {
  const VirtualAssistantChatPage({
    super.key,
  });

  @override
  State<VirtualAssistantChatPage> createState() =>
      _VirtualAssistantChatPageState();
}

class _VirtualAssistantChatPageState extends State<VirtualAssistantChatPage> {
  List<Message> messages = [
    IncomingMessage(
      postfix:
          DateFormat.Hm().format(DateTime.now().copyWith(hour: 10, minute: 44)),
      content: 'Здравствуйте, чем могу помочь?',
    ),
    const OutgoingMessage(
      content: 'Создать заявку в IT support',
    ),
    const OutgoingMessage(
      content: 'Оформить sick day',
    ),
    IncomingMessage(
      postfix:
          DateFormat.Hm().format(DateTime.now().copyWith(hour: 10, minute: 44)),
      content: 'Заявка IT1034839 успешно создана',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: ChatAppBar(
            model: Chat(
              name: 'Виртуальный ассистент',
              isOnline: true,
            ),
          ),
          body: Stack(
            children: [
              ChatMessageList(
                messages: messages,
              ),
              MessageInputField(
                onMessageSend: ({required String message}) {
                  if (message.isEmpty == true) {
                    return;
                  }
                  setState(() {
                    messages.add(
                      OutgoingMessage(
                        content: message,
                      ),
                    );
                  });
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
