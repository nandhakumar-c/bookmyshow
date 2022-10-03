import 'package:bookmyshow/LocaleString.dart';
import 'package:bookmyshow/cubit/google_sign_in/cubit/google_sign_in_cubit.dart';
import 'package:bookmyshow/loginpage/splashscreen.dart';
import 'package:bookmyshow/loginpagevalidation/google_sign_in.dart';
import 'package:bookmyshow/loginpagevalidation/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
//Todo

import 'dart:io';
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const AndroidNotificationChannel channel =
    AndroidNotificationChannel('high_importance_channel', 'Grab Your Seats Now',
        // 'Book the tickets for PS-I',
        importance: Importance.high,
        playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHnadler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Notification : ${message.messageId}');
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHnadler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(BookMyShow());
}

class BookMyShow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookMyShowState();
  }
}

class BookMyShowState extends State<BookMyShow> {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => GoogleSignInCubit(),
        child: GetMaterialApp(
          translations: LocaleString(),
          locale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          //supportedLocales: L10n.all,
        ),
      );
}

Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  //Notification Click Listener
}

class MessageHandler extends StatefulWidget {
  const MessageHandler({Key? key}) : super(key: key);

  @override
  State<MessageHandler> createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fcm.configure(
    //   onMessage:
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
