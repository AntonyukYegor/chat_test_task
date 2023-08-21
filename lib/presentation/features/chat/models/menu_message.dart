import 'package:chat_test_task/presentation/features/chat/models/message.dart';
import 'package:equatable/equatable.dart';

class MenuMessage extends Message {
  const MenuMessage({
    required super.content,
    required this.items,
  });

  final List<MenuMessageItem> items;

  @override
  List<Object?> get props => [...super.props, items];
}

class MenuMessageItem extends Equatable {
  const MenuMessageItem({
    required this.title,
    required this.call,
  });

  final String title;

  final void Function() call;

  @override
  List<Object?> get props => [title, call];
}
