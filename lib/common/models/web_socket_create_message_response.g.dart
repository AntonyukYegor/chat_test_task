// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_create_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketCreateMessageResponse _$WebSocketCreateMessageResponseFromJson(
        Map<String, dynamic> json) =>
    WebSocketCreateMessageResponse(
      json['action'] as String,
      json['message_id'] as String,
      json['chat_id'] as String,
      json['ctime'] as String,
      json['text'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$WebSocketCreateMessageResponseToJson(
        WebSocketCreateMessageResponse instance) =>
    <String, dynamic>{
      'action': instance.action,
      'message_id': instance.messageId,
      'chat_id': instance.chatId,
      'ctime': instance.creationTime,
      'text': instance.text,
      'username': instance.username,
    };
