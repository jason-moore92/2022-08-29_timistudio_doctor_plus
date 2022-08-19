import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  @override
  void dispose() {
    emailCtl.dispose();
    emailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const AppBarCpn(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: Text(
                  LocaleKeys.forgetPass.tr(),
                  style: h1(context: context, fontWeight: '700'),
                ),
              ),
              Text(
                LocaleKeys.enterEmail.tr(),
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
              ElevatedCpn(
                function: () {
                  Navigator.of(context).pushNamed(Routes.changePassword);
                },
                gradient: linear,
                textButton: LocaleKeys.sendEmail.tr(),
                textStyle:
                    h5(color: Theme.of(context).color12, fontWeight: '700'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
