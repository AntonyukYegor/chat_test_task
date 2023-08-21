import 'package:json_annotation/json_annotation.dart';

part 'web_socket_create_message_response.g.dart';

@JsonSerializable()
class WebSocketCreateMessageResponse {
  final String action;

  @JsonKey(name: 'message_id')
  final String messageId;
  @JsonKey(name: 'chat_id')
  final String chatId;
  @JsonKey(name: 'ctime')
  final String creationTime;

  final String text;
  final String username;

  WebSocketCreateMessageResponse(
    this.action,
    this.messageId,
    this.chatId,
    this.creationTime,
    this.text,
    this.username,
  );

  factory WebSocketCreateMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$WebSocketCreateMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketCreateMessageResponseToJson(this);
}
