import 'package:flutter/material.dart';

import 'package:bookmyshow/loginpagevalidation/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'package:bookmyshow/LocaleString.dart';
import 'package:bookmyshow/loginpagevalidation/google_sign_in_cubit.dart';

//Todo

import 'dart:io';
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bottomnavigation/bottomnavigator.dart';
import 'loginpage/loginpage.dart';
import 'loginpage/splashscreen.dart';

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

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHnadler);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(BookMyShow());
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
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
          locale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          // home: const SplashScreen(),
          initialRoute: "/splashscreen",
          routes: {
            "/splashscreen": (ctx) => const SplashScreen(),
            "/loginpage": (ctx) => MyApp(),
            "/bottomnavigation": (ctx) => const BottomNavigation(),
          },
          //supportedLocales: L10n.all,
        ),
      );
}
