import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/util/completed.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SentVerifySuccess extends StatelessWidget {
  const SentVerifySuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompletedScreen(
        icon: imgSentMessage,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(Routes.home);
        },
        subTitle: LocaleKeys.ourMedical.tr(),
        textButton: LocaleKeys.goDashboard.tr(),
        title: LocaleKeys.requestSentSuccessful.tr());
  }
}
