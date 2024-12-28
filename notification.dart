import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:badges/badges.dart'; // For badge UI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: NotificationBadgeExample(),
    );
  }
}

class NotificationBadgeExample extends StatefulWidget {
  @override
  _NotificationBadgeExampleState createState() =>
      _NotificationBadgeExampleState();
}

class _NotificationBadgeExampleState extends State<NotificationBadgeExample> {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  int _notificationCount = 0;

  @override
  void initState() {
    super.initState();
    _setupFirebaseMessaging();
  }

  void _setupFirebaseMessaging() async {
    // Request permission for notifications
    NotificationSettings settings = await _messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // Initialize Flutter Local Notifications
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: (String? payload) {
        _onNotificationOpened(payload);
      });

      // Listen for foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        setState(() {
          _notificationCount++;
        });

        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'high_importance_channel',
                'High Importance Notifications',
                importance: Importance.max,
              ),
            ),
          );
        }
      });

      // Listen for when notifications are tapped
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        _onNotificationOpened(message.data['screen']);
      });
    }
  }

  void _onNotificationOpened(String? screen) {
    switch (screen) {
      case 'news':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FarmerNewsScreen()));
        break;
      case 'order':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
        break;
      case 'weather':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WeatherReportScreen()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer App'),
        actions: [
          Badge(
            badgeContent: Text('$_notificationCount'),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                setState(() {
                  _notificationCount = 0; // Reset badge count
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()));
              },
            ),
          ),
        ],
      ),
      body: Center(child: Text('Welcome to Farmer App!')),
    );
  }
}

// Mock Screens for Navigation
class FarmerNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Farmer News')));
  }
}

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Order Success')));
  }
}

class WeatherReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Weather Report')));
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('All Notifications')));
  }
}
