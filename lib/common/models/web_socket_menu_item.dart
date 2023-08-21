import 'package:json_annotation/json_annotation.dart';

part 'web_socket_menu_item.g.dart';

@JsonSerializable()
class WebSocketMenuItem {
  final String id;

  final String title;

  WebSocketMenuItem(
    this.id,
    this.title,
  );

  factory WebSocketMenuItem.fromJson(Map<String, dynamic> json) =>
      _$WebSocketMenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketMenuItemToJson(this);
}
