import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_pass.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({Key? key}) : super(key: key);

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  TextEditingController resetCodeCtl = TextEditingController();
  FocusNode resetCodeFn = FocusNode();
  TextEditingController newPasswordCtl = TextEditingController();
  FocusNode newPasswordFn = FocusNode();
  TextEditingController confirmPasswordCtl = TextEditingController();
  FocusNode confirmPasswordFn = FocusNode();
  @override
  void dispose() {
    resetCodeCtl.dispose();
    resetCodeFn.dispose();
    newPasswordCtl.dispose();
    newPasswordFn.dispose();
    confirmPasswordCtl.dispose();
    confirmPasswordFn.dispose();
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
                  LocaleKeys.recoveryPass.tr(),
                  style: h1(context: context, fontWeight: '700'),
                ),
              ),
              Text(
                LocaleKeys.enterCode.tr(),
                style: h6(context: context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 24),
                child: TextFieldCpn(
                  controller: resetCodeCtl,
                  focusNode: resetCodeFn,
                  labelText: LocaleKeys.resetCode.tr(),
                ),
              ),
              TextFieldPassCpn(
                controller: newPasswordCtl,
                focusNode: newPasswordFn,
                labelText: LocaleKeys.newPass.tr(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TextFieldPassCpn(
                  controller: confirmPasswordCtl,
                  focusNode: confirmPasswordFn,
                  labelText: LocaleKeys.confirmPass.tr(),
                ),
              ),
              ElevatedCpn(
                function: () {
                  Navigator.of(context).pushNamed(Routes.changePassSuccess);
                },
                gradient: linear,
                textButton: LocaleKeys.changePass.tr(),
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
