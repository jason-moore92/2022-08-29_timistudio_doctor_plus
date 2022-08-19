import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/util/completed.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import '../../../common/route/routes.dart';

class ChangePassSuccess extends StatelessWidget {
  const ChangePassSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompletedScreen(
        icon: imgSuccess,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(Routes.login);
        },
        subTitle: LocaleKeys.successChangePass.tr(),
        textButton: LocaleKeys.logInNow.tr(),
        title: LocaleKeys.congrats.tr());
  }
}
