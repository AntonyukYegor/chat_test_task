import 'package:chat_test_task/presentation/features/chat/bloc/message_cubit.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/chat_app_bar.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/chat_message_list.dart';
import 'package:chat_test_task/presentation/features/chat/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebSocketChatPage extends StatelessWidget {
  const WebSocketChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: ChatAppBar(
            model: Chat(
              name: 'Web Socket',
              isOnline: true,
            ),
          ),
          body: Stack(
            children: [
              BlocBuilder<MessageCubit, MessageCubitState>(
                builder: (_, state) => ChatMessageList(
                  messages: state.messages,
                ),
              ),
              MessageInputField(
                initText: 'menu',
                onMessageSend: ({required String message}) {
                  if (message.isEmpty == true) {
                    return;
                  }
                  context.read<MessageCubit>().sendMessage(message: message);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
