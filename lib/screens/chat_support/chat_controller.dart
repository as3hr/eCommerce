// ignore_for_file: avoid_print

import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/chat.dart';
import '../../models/data/api.dart';
import '../../models/message.dart';
import '../log_in_view/auth_controller.dart';

class ChatController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    socketConnect();
    await getAllChats();
  }

  //initial declarations
  var currentChat = Chat();
  bool showImage = false;
  List<Message> messages = [];
  List<Chat> allChats = [];
  String currentImage = '';
  String selectedImage = '';
  bool isLoading = true;
  bool filePicked = false;
  int limit = 25;
  final messageController = TextEditingController();
  final user = Get.find<AuthController>().user;
  late io.Socket socket;

  Future<void> getAllChats() async {
    allChats = await Api.getChats();
    await getChatById(allChats.first.id ?? '');
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
      messages.addAll(await Api.getMessages(
          limit: limit,
          page: page,
          chatId: currentChat.id!,
          extraQuery: {
            'sort': {'date': -1}
          }));
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
      print('User message received: $data');
    });
    socket.onDisconnect((_) {
      print('Disconnected from the Chat Server');
    });
  }

  Future<void> sendMessage() async {
    if (messageController.text.isNotEmpty ||
        (currentImage.isNotEmpty == true)) {
      final message = Message(
        text: messageController.text,
        image: currentImage.isNotEmpty ? currentImage : null,
        date: DateTime.now(),
        chatId: currentChat.id,
        isUser: false,
      );
      messages.insert(0, message);
      filePicked = false;
      currentImage = '';
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
