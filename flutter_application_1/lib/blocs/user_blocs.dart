import 'dart:html';

import 'package:flutter_application_1/model/chat_model.dart';

class UserBloc {
  List<ChatModel> _listChat = [];

  set setListChat(List<ChatModel> chat) {
    _listChat = chat;
  }

  List<ChatModel> get getListChat => _listChat;
}
