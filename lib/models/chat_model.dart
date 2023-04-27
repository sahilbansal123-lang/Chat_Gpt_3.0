import 'package:flutter/material.dart';

class ChatModel {
  final String msg;
  final int chatIndex;

  ChatModel({required this.chatIndex, required this.msg});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      msg: json["msg"],
      chatIndex: json["chatIndex"],
  );

}