import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'local_notification_platform_interface.dart';

/// An implementation of [LocalNotificationPlatform] that uses method channels.
class MethodChannelLocalNotification extends LocalNotificationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('local_notification');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
