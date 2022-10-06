import 'package:bookmyshow/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              color: Colors.blue, playSound: true, icon: '@mipmap/ic_launcher'),
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp event published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                '${notification?.title}',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              content: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('${notification?.body}')],
              )),
            );
          });
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        'Watch PS-I near your theatres',
        'Grab your seats now!!',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => Navigator.of(context).pop()),
            backgroundColor: Color.fromARGB(255, 10, 21, 46),
            actions: [
              IconButton(
                onPressed: showNotification,
                icon: Icon(Icons.notification_add),
              )
            ],
            title: Text("Notifications")),
        body: Center(
          child: Container(
            child: Text('No New Notifications'),
          ),
        ));
  }
}
