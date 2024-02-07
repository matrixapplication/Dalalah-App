import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../src/main_index.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'mttgrNotifications', "mttgr Notifications",
    enableVibration: true,
    importance: Importance.high,
    playSound: true,
    showBadge: true,
    sound: RawResourceAndroidNotificationSound('mttgr_notification'),
    description: "Notifications for mttgr users");

final FlutterLocalNotificationsPlugin flutterLocalNotificationplugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('onBackgroundMessage: ${message.data}');
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
}

class FirebaseNotification {
  String? firebaseNotificationToken;

  bool get mounted => false;

  initialize(BuildContext context) async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationplugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeSettingIOS = DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializeSettingIOS);

    flutterLocalNotificationplugin.initialize(
      initializationSettings,
      // onSelectNotification: (payload) {
      //   print('onSelectNotification: $payload');
      //   if (payload != null) {
      //     final data = jsonDecode(payload);
      //     setRouteFromNotificationData(context: context, data: data);
      //   }
      // },
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationplugin.getNotificationAppLaunchDetails();
    String? payload = notificationAppLaunchDetails!.notificationResponse?.payload;
    if (payload != null) {
      final data = jsonDecode(payload);
      if (mounted) return;
  //    setRouteFromNotificationData(context: context, data: data);
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      print('getInitialMessage: $message');
      print('getInitialMessage data: ${message?.data}');
      // if (message != null) {
      //   routeFromNotificationMessage(context, message);
      // }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('onMessage: ${message.messageId}');
      RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      if (notification != null) {
        flutterLocalNotificationplugin.show(notification.hashCode,
            notification.title, notification.body, _notificationDetails(),
            payload: jsonEncode(message.data));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print('onMessageOpenedApp: ${message.messageId}');
      RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      // if (notification != null) {
      //   routeFromNotificationMessage(context, message);
      // }
    });

    await getToken();
  }

  // Future<void> routeFromNotificationMessage(
  //     BuildContext context, RemoteMessage message) async {
  //   print('routeFromNotificationMessage');
  //   setRouteFromNotificationData(context: context, data: message.data);
  // }

// support ticket

  Future<String?> getToken() async {
    print('get token called');
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    firebaseNotificationToken = firebaseToken;
    if (kDebugMode) {
      print('firebaseToken =========================> $firebaseNotificationToken');
    }
    return firebaseToken;
  }

  Future<void> deleteToken() async {
    await FirebaseMessaging.instance.deleteToken();
  }

  static NotificationDetails _notificationDetails() {
    print('_notificationDetails');
    return NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            priority: Priority.high),
        iOS: const DarwinNotificationDetails());
  }

  subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  // setRouteFromNotificationData(
  //     {required BuildContext context,
  //     required Map<String, dynamic> data}) async {
  //   print('setRouteFromNotificationData');
  //   final route = data['page'];
  //   final id = data['id'];
  //   final ServicesLocator navigationService = sl<ServicesLocator>();
  //   await autoLogin();
  //   if (route != null && id != null) {
  //     switch (route) {
  //       case 'paymentReceipt':
  //         navigationService.pushReplacement(ReceiptScreen(receipt: data['id']));
  //         break;
  //       case 'orderDetail':
  //         navigationService.pushReplacement(OrderDetailsScreen(orderId: data['id']));
  //         break;
  //       case 'supportTickets':
  //         navigationService.pushReplacement(OrderDetailsScreen(orderId: data['id']));
  //         break;
  //       case 'productDetails':
  //         navigationService.pushReplacement(ProductDetailsPage(variantId: data['id'], isFav: false));
  //         break;
  //     }
  //   } else {
  //     // if (data['page'] == null) {
  //     //   HelperMethods.showErrorToast(
  //     //       "Notification doesn't contain destination page");
  //     // } else if (data['id'] == null) {
  //     //   HelperMethods.showErrorToast("Notification doesn't contain object id");
  //     // }
  //   }
  // }
}

// autoLogin() async {
//   Dio dio = ClientCreator().createClient();
//   bool isTokenExpired = await HelperMethods.isTokenExpired();
//   if (!isTokenExpired) return;
//   LoginParams params = await HelperMethods.getUserData();
//   try {
//     final response = await dio.post(
//       Apis.login,
//       data: params.toJson(),
//     );
//     Map data = response.data;
//     HelperMethods.saveToken(data['token']);
//   } catch (e) {
//     print('error in auto login $e');
//   }
// }
