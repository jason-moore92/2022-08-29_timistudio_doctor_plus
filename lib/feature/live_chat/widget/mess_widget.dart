import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';

class MessWidget extends StatelessWidget {
  const MessWidget({Key? key, required this.message}) : super(key: key);
  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Container(
      width: width / 4 * 2.5,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(4),
              bottomLeft: Radius.circular(16)),
          color: message['sender'] == 'me' ? isabelline : blueCrayola),
      child: Text(
        message['message']!,
        style: h4(
            color: message['sender'] == 'me'
                ? Theme.of(context).color11
                : grey100),
      ),
    );
  }
}
