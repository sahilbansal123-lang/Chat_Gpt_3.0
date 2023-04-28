import 'package:chatgpt_course/services/api_services.dart';
import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(
      ChatModel(chatIndex: 0, msg: msg)
    );
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers({required String msg, required String chosenModelId})async{
    chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
    )
    ); notifyListeners();
  }
}