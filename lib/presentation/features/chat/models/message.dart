import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String content;

  const Message({
    required this.content,
  });

  @override
  List<Object?> get props => [content];
}
