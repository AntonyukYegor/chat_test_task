import 'package:chat_test_task/common/repositories/message_repository.dart';
import 'package:chat_test_task/presentation/features/chat/models/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class MessageCubit extends Cubit<MessageCubitState> {
  MessageCubit({
    required this.messageRepository,
    required List<Message> messages,
  }) : super(
          MessageCubitState(messages: messages),
        );
  final MessageRepository messageRepository;

  Future<void> sendMessage({required String message}) async {
    messageRepository.sendMessage(message: message);
  }

  void init() {
    messageRepository.init();
    messageRepository.stream.listen((event) {
      emit(state.copyWith(messages: [...state.messages, event]));
    });
  }
}

class MessageCubitState extends Equatable {
  final List<Message> messages;

  const MessageCubitState({
    required this.messages,
  });

  copyWith({List<Message>? messages}) =>
      MessageCubitState(messages: messages ?? this.messages);

  @override
  List<Object?> get props => [messages];
}
