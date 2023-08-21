// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_create_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketCreateMenuResponse _$WebSocketCreateMenuResponseFromJson(
        Map<String, dynamic> json) =>
    WebSocketCreateMenuResponse(
      json['action'] as String,
      json['id'] as String,
      json['title'] as String,
      json['chat_id'] as String,
      json['ctime'] as String,
      (json['menu'] as List<dynamic>)
          .map((e) => WebSocketMenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WebSocketCreateMenuResponseToJson(
        WebSocketCreateMenuResponse instance) =>
    <String, dynamic>{
      'action': instance.action,
      'id': instance.id,
      'title': instance.title,
      'chat_id': instance.chatId,
      'ctime': instance.creationTime,
      'menu': instance.menu,
    };
