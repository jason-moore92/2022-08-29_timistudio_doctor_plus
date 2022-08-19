import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_pass.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_phone.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    emailCtl.dispose();
    passwordCtl.dispose();
    passwordFn.dispose();
    emailFn.dispose();
    phoneCtl.dispose();
    phoneFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedCpn(
            gradient: linear,
            textButton: LocaleKeys.logIn.tr(),
            textStyle: h5(color: Theme.of(context).color12),
          ),
          OutlinedCpn(
            textButton: LocaleKeys.logIn.tr(),
          ),
          SearchCpn(
            controller: searchCtl,
            focusNode: searchFn,
            hasShadow: false,
          ),
          SearchCpn(
            controller: searchCtl,
            focusNode: searchFn,
            hintText: 'Search patient, health issue, ...',
            fillColor: grey100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 24),
            child: TextFieldCpn(
              controller: emailCtl,
              focusNode: emailFn,
              focusNext: passwordFn,
              labelText: 'Email',
              showSuffixIcon: true,
            ),
          ),
          TextFieldPassCpn(
            controller: passwordCtl,
            focusNode: passwordFn,
            labelText: 'Password',
          ),
          TextFieldPhone(
            controller: phoneCtl,
            focusNode: phoneFn,
            labelText: 'Mobile Phone',
          ),
          AnimationClick(function:(){},child: const Text('dsfdsf')),
          const AppBarCpn()
        ],
      ),
    );
  }
}
