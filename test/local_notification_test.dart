import 'package:flutter_test/flutter_test.dart';
import 'package:local_notification/local_notification.dart';
import 'package:local_notification/local_notification_platform_interface.dart';
import 'package:local_notification/local_notification_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocalNotificationPlatform
    with MockPlatformInterfaceMixin
    implements LocalNotificationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LocalNotificationPlatform initialPlatform = LocalNotificationPlatform.instance;

  test('$MethodChannelLocalNotification is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocalNotification>());
  });

  test('getPlatformVersion', () async {
    LocalNotification localNotificationPlugin = LocalNotification();
    MockLocalNotificationPlatform fakePlatform = MockLocalNotificationPlatform();
    LocalNotificationPlatform.instance = fakePlatform;

    expect(await localNotificationPlugin.getPlatformVersion(), '42');
  });
}
