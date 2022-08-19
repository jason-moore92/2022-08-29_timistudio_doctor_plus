import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_pass.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_phone.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();

  @override
  void dispose() {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const AppBarCpn(),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  LocaleKeys.welcomeToDoctorPlus.tr(),
                  style: h1(context: context, fontWeight: '700'),
                ),
              ),
              Text(
                LocaleKeys.joinDoctor.tr(),
                style: h6(context: context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 24),
                child: TextFieldCpn(
                  controller: emailCtl,
                  focusNode: emailFn,
                  labelText: LocaleKeys.email.tr(),
                ),
              ),
              TextFieldPhone(
                controller: phoneCtl,
                focusNode: phoneFn,
                labelText: LocaleKeys.mbPhone.tr(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TextFieldPassCpn(
                  controller: passwordCtl,
                  focusNode: passwordFn,
                  labelText: LocaleKeys.password.tr(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ElevatedCpn(
                  function: () {
                    Navigator.of(context).pushNamed(Routes.verifyPhone);
                  },
                  gradient: linear,
                  textButton: LocaleKeys.signUp.tr(),
                  textStyle:
                      h5(color: Theme.of(context).color12, fontWeight: '700'),
                ),
              ),
              Text(
                LocaleKeys.privacy.tr(),
                style: h7(color: grayBlue),
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.alreadyAccount.tr(),
                    style: h7(color: grayBlue),
                  ),
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pushReplacementNamed(Routes.login);
                    },
                    child: Text(
                      LocaleKeys.logIn.tr(),
                      style: h7(
                          color: dodgerBlue,
                          fontWeight: '600',
                          hasUnderLine: true),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
