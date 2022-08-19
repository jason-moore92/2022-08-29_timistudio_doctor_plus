import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/util/completed.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompletedScreen(
        icon: imgSuccess2,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.updateProfileStepOne);
        },
        subTitle: LocaleKeys.fillOutYourWorkProfile.tr(),
        textButton: LocaleKeys.fillOutMyWorkProfile.tr(),
        title: LocaleKeys.welcomeToDoctorPlus.tr());
  }
}
