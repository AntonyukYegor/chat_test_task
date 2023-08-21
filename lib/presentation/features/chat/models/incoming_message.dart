import 'package:chat_test_task/presentation/features/chat/models/message.dart';

class IncomingMessage extends Message {
  const IncomingMessage({
    required this.postfix,
    required super.content,
  });

  final String postfix;
  @override
  List<Object?> get props => [...super.props, postfix];
}
