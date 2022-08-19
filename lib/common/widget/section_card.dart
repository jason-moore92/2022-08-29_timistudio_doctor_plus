import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/profile_management.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({Key? key, required this.item}) : super(key: key);
  final Map<dynamic, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final news = item['new'] != null && item['new'] > 150
        ? '150+'
        : item['new'].toString();
    return AnimationClick(
      function: () {
        if (item["name"] == LocaleKeys.workProfileManagement.tr()) {
          Navigator.of(context).pushNamed(item['path'],
              arguments: const ProfileManagement(doctorModel: user));
        } else {
          Navigator.of(context).pushNamed(item['path']);
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ImageAsset(item["img"] ?? imgLogo, width: 56, height: 56),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(item["name"] ?? "invalid",
                  textAlign: TextAlign.center, style: h6(context: context)),
            ),
            item["new"] != null
                ? Text(news + " " + LocaleKeys.news.tr(),
                    style: h6(color: grayBlue))
                : const SizedBox(),
          ],
        ),
        decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              offset: Offset(0, 2),
              color: Color.fromRGBO(167, 115, 102, 0.16),
            ),
          ],
        ),
      ),
    );
  }
}
