import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _fireBaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fireBaseMessaging.requestPermission();

    final _fcmToken = await _fireBaseMessaging.getToken();

    print(_fcmToken.toString());
  }
}
