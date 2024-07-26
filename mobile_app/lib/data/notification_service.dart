import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  final messaging = FirebaseMessaging.instance;
  NotificationService();

  Future<void> requestPermission() async {
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        final notification = message.notification ?? const RemoteNotification();
        showToast(
          message: '${notification.body}',
          snackPosition: SnackPosition.TOP,
          title: '${notification.title}',
          imagePath: AppImages.bellImage,
          duration: const Duration(seconds: 2),
        );
      });
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      showToast(
        message:
            'You have denied notification Permission!\nGo to app settings to change it and recieve notifications from this app',
        imagePath: AppImages.access,
      );
    }
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // final data = message.data;
    // final notification = message.notification ?? const RemoteNotification();
  }

  Future<String> getNotificationToken() async {
    return await messaging.getToken() ?? '';
  }
}
