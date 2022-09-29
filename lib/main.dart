import 'package:bookmyshow/LocaleString.dart';
import 'package:bookmyshow/cubit/google_sign_in/cubit/google_sign_in_cubit.dart';
import 'package:bookmyshow/loginpage/splashscreen.dart';
import 'package:bookmyshow/loginpagevalidation/google_sign_in.dart';
import 'package:bookmyshow/loginpagevalidation/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(BookMyShow());
// }

Future main() async {
  //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
  //Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
