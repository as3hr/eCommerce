// ignore_for_file: avoid_print

import 'dart:async';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:e_commerce/data/api.dart';
import 'package:e_commerce/models/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce/models/message.dart';
import 'package:get/get.dart';
import '../../../../../helpers/functions/loader.dart';
import '../../../../../helpers/styles/app_decoration.dart';

class ChatController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getMyChat();
    await getMessages();
    socketConnect();
  }

  //initial declarations
  var myChat = Chat();
  bool showImage = false;
  List<Message> messages = [];
  String currentImage = '';
  String selectedImage = '';
  bool isLoading = true;
  bool messagesFetched = false;
  bool filePicked = false;
  int limit = 25;
  final messageController = TextEditingController();
  final user = Get.find<AuthController>().user;
  late io.Socket socket;
  final picker = ImagePicker();

  Future<void> getMyChat() async {
    myChat = await Api.getMyChat();
    isLoading = false;
    update();
  }

  Future<void> createChat() async {
    await Api.createChat();
    await getMyChat();
    socketConnect();
  }

  Future<bool> getMessages({bool refresh = false}) async {
    if (refresh) {
      messages.clear();
    }
    int page = (messages.length / limit).ceil() + 1;
    if (myChat.id != null) {
      messages.addAll(await Api.getMessages(
          limit: limit,
          page: page,
          chatId: myChat.id!,
          extraQuery: {
            'sort': {'date': -1}
          }));
      messagesFetched = true;
      update();
      if (messages.length < limit) return false;
    }
    messagesFetched = true;
    update();
    return true;
  }

  void socketConnect() {
    if (myChat.id == null) return;
    socket = io.io(Api.baseUrl, {
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connected to the Chat Server');
    });
    final joinRoom = {
      'userId': user.id,
      'chatId': myChat.id,
    };
    if (user.id != null) socket.emit('userJoinRoom', joinRoom);
    socket.on('newAdminMessage', (data) {
      final message = Message.fromJson(data);
      messages.insert(0, message);
      update();
      print('Admin message: $data');
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
        chatId: myChat.id,
        isUser: true,
      );
      messages.insert(0, message);
      filePicked = false;
      currentImage = '';
      messageController.clear();
      update();
      socket.emit('sendUserMessage', message.toJson());
    }
  }

  Future showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'Photo Gallery',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              loadingWrapper(() async {
                await getImage(ImageSource.gallery);
              });
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Camera',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              loadingWrapper(() async {
                await getImage(ImageSource.camera);
              });
            },
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final file = await picker.pickImage(source: source);
    if (file != null) {
      currentImage = await Api.uploadImage(file.path, file.name);
      filePicked = true;
      update();
    }
  }

  void toggleImageSelection({String? image}) {
    if (image != null) {
      selectedImage = image;
      showImage = true;
    } else {
      selectedImage = '';
      showImage = false;
    }
    update();
  }

  @override
  void onClose() {
    if (myChat.id != null) {
      socket.disconnect();
      socket.close();
    }
    super.onClose();
  }

  @override
  void dispose() {
    if (myChat.id != null) {
      socket.dispose();
    }
    super.dispose();
  }
}
