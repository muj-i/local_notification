import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

abstract class NotificationPermissionAlert {
  static Future<void> show(
      {required Function() onAllowPress,
      Function()? onDenyPress,
      required String appName,
      Color? allowButtonColor,
      Color? denyButtonColor}) async {
    await Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        '$appName needs your permission',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications,
            size: 50,
          ),
          SizedBox(height: 8),
          Text(
            'To proceed, you need to enable the permission to receive notifications',
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: onDenyPress ??
                () {
                  Get.back();
                },
            child: Text(
              'Deny',
              style: TextStyle(
                color: denyButtonColor ?? Colors.redAccent.shade200,
                fontSize: 16,
              ),
            )),
        TextButton(
          onPressed: onAllowPress,
          child: Text(
            'Allow',
            style: TextStyle(
              color: allowButtonColor ?? Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ));
  }
}
