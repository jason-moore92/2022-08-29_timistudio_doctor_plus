import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/feature/home_schedule/widget/notification_item.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCpn(
            right: Row(
          children: const [
            IconButtonCpn(
                path: icEyeOn, iconColor: dodgerBlue, borderColor: dodgerBlue),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: IconButtonCpn(
                  path: icSetting,
                  iconColor: dodgerBlue,
                  borderColor: dodgerBlue),
            )
          ],
        )),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24, bottom: 40),
                child: Text(LocaleKeys.notifications.tr(),
                    style: h1(context: context, fontWeight: '700')),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    return NotificationItem(item: notificationList[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
