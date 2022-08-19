import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/notifications.dart';

BottomNavigationBarItem createItemNav(
    BuildContext context, String pathIcon, String label,
    {int notifications = 0}) {
  final hasNotification = notifications > 0;
  return BottomNavigationBarItem(
      activeIcon: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: tiffanyBlue.withOpacity(0.2),
          ),
          child: hasNotification
              ? Notifications(
                  iconPath: pathIcon,
                  notifications: notifications,
                  iconColor: tiffanyBlue,
                  isIcon: true,
                )
              : ImageAsset(pathIcon, color: tiffanyBlue)),
      icon: hasNotification
          ? Notifications(
              iconPath: pathIcon,
              notifications: notifications,
              iconColor: grayBlue,
              isIcon: true)
          : ImageAsset(pathIcon, color: grayBlue),
      label: label);
}
