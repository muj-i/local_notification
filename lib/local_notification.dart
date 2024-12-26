import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification/src/local_notification_services.dart';

import 'local_notification_platform_interface.dart';

class LocalNotification {
  Future<String?> getPlatformVersion() {
    return LocalNotificationPlatform.instance.getPlatformVersion();
  }

  static Future<void> init(
      {required String channelId,
      required String channelName,
      required String channelDescription,
      Importance? importance}) async {
    return LocalNotificationServices.init(
        channelId, channelName, channelDescription, importance);
  }

  static Future<void> permission(
    String appName,
  ) async {
    return LocalNotificationServices.permission(appName);
  }

  static Future<void> showLocalNotification(
      int id, String title, String body) async {
    return LocalNotificationServices.showLocalNotification(id, title, body);
  }

  static Future<void> scheduleNotification(
      int id, String title, String body, DateTime scheduledTime) async {
    return LocalNotificationServices.scheduleNotification(
        id, title, body, scheduledTime);
  }

  static Future<void> cancelNotification(int id) async {
    return LocalNotificationServices.cancelNotification(id);
  }
}
