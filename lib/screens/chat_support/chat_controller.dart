// ignore_for_file: avoid_print

import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chat.dart';
import '../../models/data/api.dart';
import '../../models/message.dart';
import '../../models/pagination.dart';
import '../log_in_view/auth_controller.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    socketConnect();
    getAllChats();
  }

  //initial declarations
  late Pagination<Message> messagePagination;
  late Pagination<Chat> chatsPagination;
  var currentChat = Chat();
  bool isLoading = true;
  int limit = 25;
  List<Message> messages = [];
  List<Chat> allChats = [];
  final messageController = TextEditingController();
  final user = Get.find<AuthController>().user;
  late io.Socket socket;

  Future<void> getAllChats({bool refresh = false}) async {
    if (refresh) allChats.clear();
    chatsPagination = await Api.getChats();
    allChats = chatsPagination.data;
    if (allChats.isNotEmpty) {
      await getChatById(allChats.first.id ?? '');
    }
    isLoading = false;
    update();
  }

  Future<void> getChatById(String id) async {
    currentChat = await Api.getChatById(id);
    final joinRoom = {
      'userId': user!.id,
      'chatId': currentChat.id,
    };
    socket.emit('adminJoinRoom', joinRoom);
    await getMessages(refresh: true);
    update();
  }

  Future<bool> getMessages({bool refresh = false}) async {
    if (refresh) {
      messages.clear();
    }
    int page = (messages.length / limit).ceil() + 1;
    if (currentChat.id != null) {
      messagePagination = await Api.getMessages(
          limit: limit,
          page: page,
          chatId: currentChat.id!,
          extraQuery: {
            'sort': {'date': -1}
          });
      messages.addAll(messagePagination.data);
      update();
      if (messages.length < limit) return false;
    }
    return true;
  }

  void socketConnect() {
    socket = io.io('http://localhost:3000', {
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connected to the Chat Server');
    });
    socket.on('newUserMessage', (data) {
      final message = Message.fromJson(data);
      messages.insert(0, message);
      update();
    });
    socket.onDisconnect((_) {
      print('Disconnected from the Chat Server');
    });
  }

  Future<void> sendMessage() async {
    if (messageController.text.isNotEmpty) {
      final message = Message(
        text: messageController.text,
        date: DateTime.now(),
        chatId: currentChat.id,
        isUser: false,
      );
      messages.insert(0, message);
      messageController.clear();
      update();
      socket.emit('sendAdminMessage', message.toJson());
    }
  }

  @override
  void onClose() {
    if (currentChat.id != null) {
      socket.disconnect();
      socket.close();
    }
    super.onClose();
  }

  @override
  void dispose() {
    if (currentChat.id != null) {
      socket.dispose();
    }
    super.dispose();
  }
}
