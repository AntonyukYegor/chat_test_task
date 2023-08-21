import 'package:chat_test_task/common/models/web_socket_menu_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_socket_create_menu_response.g.dart';

@JsonSerializable()
class WebSocketCreateMenuResponse {
  final String action;
  final String id;
  final String title;
  @JsonKey(name: 'chat_id')
  final String chatId;
  @JsonKey(name: 'ctime')
  final String creationTime;
  final List<WebSocketMenuItem> menu;

  WebSocketCreateMenuResponse(
    this.action,
    this.id,
    this.title,
    this.chatId,
    this.creationTime,
    this.menu,
  );

  factory WebSocketCreateMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$WebSocketCreateMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketCreateMenuResponseToJson(this);
}
