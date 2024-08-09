import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("__________________TOKEN ${fCMToken}");
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    Navigator.pushNamed(
        navigatorKey.currentContext!, AppRoutes.notificationPage,
        arguments: message);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
