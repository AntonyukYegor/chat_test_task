import 'package:chat_test_task/presentation/features/chat/models/incoming_message.dart';
import 'package:chat_test_task/presentation/features/chat/models/menu_message.dart';
import 'package:chat_test_task/presentation/features/chat/models/message.dart';
import 'package:chat_test_task/presentation/features/chat/models/outgoing_message.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/incoming_message_bubble.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/menu_message_bubble.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/outgoing_message_bubble.dart';
import 'package:flutter/material.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.messages,
  });

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 54,
        bottom: 108,
        right: 18,
        left: 18,
      ),
      itemBuilder: (context, index) {
        Message currentMessage = messages[index];

        double padding = index == 0
            ? 0
            : currentMessage.runtimeType == messages[index - 1].runtimeType
                ? 9
                : 13;

        if (currentMessage is MenuMessage) {
          return MenuMessageBubble(model: currentMessage);
        }

        return Padding(
          padding: EdgeInsets.only(top: padding),
          child: currentMessage is IncomingMessage
              ? IncomingMessageBubble(model: currentMessage)
              : OutgoingMessageBubble(model: currentMessage as OutgoingMessage),
        );
      },
      itemCount: messages.length,
    );
  }
}
