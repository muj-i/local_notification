import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'local_notification_method_channel.dart';

abstract class LocalNotificationPlatform extends PlatformInterface {
  /// Constructs a LocalNotificationPlatform.
  LocalNotificationPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocalNotificationPlatform _instance = MethodChannelLocalNotification();

  /// The default instance of [LocalNotificationPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocalNotification].
  static LocalNotificationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocalNotificationPlatform] when
  /// they register themselves.
  static set instance(LocalNotificationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
