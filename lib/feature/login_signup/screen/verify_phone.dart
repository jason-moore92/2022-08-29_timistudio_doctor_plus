import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({Key? key}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  TextEditingController pinCtl = TextEditingController();
  FocusNode pinFn = FocusNode();
  bool showAcceptIcon = false;

  BoxDecoration pinPutDecoration({Color? color}) {
    return BoxDecoration(
      border: Border.all(color: color ?? isabelline),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  void dispose() {
    pinCtl.dispose();
    pinFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const AppBarCpn(),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.verification.tr(),
                style: h1(context: context, fontWeight: '700'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 48),
                child: Text(
                  LocaleKeys.checkYouMessage.tr(),
                  style: h6(context: context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width / 4 * 3,
                    child: PinPut(
                      autofocus: true,
                      fieldsCount: 5,
                      onSubmit: (String pin) {},
                      onChanged: (value) {
                        setState(() {
                          if (value.trim().length == 5) {
                            showAcceptIcon = true;
                          } else {
                            showAcceptIcon = false;
                          }
                        });
                      },
                      eachFieldWidth: 48,
                      eachFieldHeight: 56,
                      textStyle: h0(context: context, fontWeight: '600'),
                      focusNode: pinFn,
                      controller: pinCtl,
                      submittedFieldDecoration: pinPutDecoration(color: goGreen),
                      selectedFieldDecoration: pinPutDecoration(color: goGreen),
                      followingFieldDecoration: pinPutDecoration(),
                    ),
                  ),
                  showAcceptIcon ? const Icon(Icons.check_circle_outline, color: goGreen, size: 24) : const SizedBox()
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.didNtCode.tr(),
                      style: h7(color: grayBlue),
                    ),
                    AnimationClick(
                      child: Text(
                        LocaleKeys.sendAgain.tr(),
                        style: h7(color: dodgerBlue, hasUnderLine: true),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedCpn(
                function: () {
                  Navigator.of(context).pushNamed(Routes.signUpSuccess);
                },
                gradient: linear,
                textButton: LocaleKeys.verify.tr(),
                rightWidget: const Icon(
                  Icons.arrow_right_alt_rounded,
                  size: 24,
                ),
                textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
