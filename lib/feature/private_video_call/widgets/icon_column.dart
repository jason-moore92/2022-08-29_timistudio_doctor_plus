import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';

class IconColumn extends StatelessWidget {
  const IconColumn({
    Key? key,
    this.function,
    required this.icon,
    required this.title,
    this.notifications = 0,
    this.bgOpacity = 0.2,
  }) : super(key: key);
  final VoidCallback? function;
  final String icon;
  final String title;
  final int notifications;
  final double bgOpacity;

  @override
  Widget build(BuildContext context) {
    final over = notifications > 9;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButtonCpn(
              function: function,
              path: icon,
              bgColor: grey100.withOpacity(bgOpacity),
              iconColor: grey100,
              borderRadius: 16,
              paddingAll: 12,
              widthIcon: 32,
              heightIcon: 32,
              hasOutline: false,
            ),
            notifications != 0
                ? Positioned(
                    top: -5,
                    right: -5,
                    child: Container(
                      padding: EdgeInsets.all(over ? 0 : 1),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: neonFuchsia),
                      child: over
                          ? Text(
                              '9+',
                              textAlign: TextAlign.center,
                              style: h9(color: grey100, fontWeight: '600'),
                            )
                          : Text(
                              '$notifications',
                              textAlign: TextAlign.center,
                              style: h8(color: grey100, fontWeight: '600'),
                            ),
                    ))
                : const SizedBox()
          ],
        ),
        const SizedBox(height: 12),
        Text(title, style: h6(color: grey100)),
      ],
    );
  }
}
