import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_pass.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();

  @override
  void dispose() {
    emailCtl.dispose();
    passwordCtl.dispose();
    passwordFn.dispose();
    emailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 76, left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ImageAsset(
                imgLogo,
                width: 72,
                height: 66,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  LocaleKeys.welcome.tr(),
                  style: h5(fontWeight: '700', context: context),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              TextFieldCpn(
                controller: emailCtl,
                focusNode: emailFn,
                focusNext: passwordFn,
                labelText: LocaleKeys.email.tr(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TextFieldPassCpn(
                  controller: passwordCtl,
                  focusNode: passwordFn,
                  labelText: LocaleKeys.password.tr(),
                ),
              ),
              ElevatedCpn(
                function: () {
                  Navigator.of(context).pushReplacementNamed(Routes.home);
                },
                gradient: linear,
                textButton: LocaleKeys.logIn.tr(),
                textStyle:
                    h5(color: Theme.of(context).color12, fontWeight: '700'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AnimationClick(
                  function: () {
                    Navigator.of(context).pushNamed(Routes.forgotPassword);
                  },
                  child: Text(
                    LocaleKeys.forgetPass.tr(),
                    style: h7(
                        fontWeight: '600', context: context, color: grayBlue),
                  ),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.dontAcc.tr(),
                    style: h7(color: grayBlue),
                  ),
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pushReplacementNamed(Routes.signUp);
                    },
                    child: Text(
                      LocaleKeys.signUp.tr(),
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
