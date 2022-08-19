import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ReportProblem extends StatefulWidget {
  const ReportProblem({Key? key}) : super(key: key);

  @override
  State<ReportProblem> createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  bool choiceOne = false;
  bool choiceTwo = false;
  bool choiceThree = false;
  Widget reportRow(BuildContext context, String title, Function(bool?) function,
      bool choice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: h4(context: context),
        ),
        Checkbox(
            value: choice,
            activeColor: tiffanyBlue,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: dodgerBlue),
                borderRadius: BorderRadius.circular(4)),
            onChanged: function)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: close,
        color: grey100,
        center: Text(
          LocaleKeys.reportCallProblem.tr(),
          style: h3(
            context: context,
            fontWeight: '700',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.tellUs.tr(),
              style: h5(context: context, fontWeight: '700'),
            ),
            const SizedBox(height: 40),
            reportRow(context, "The patient's phone busy", (value) {
              setState(() {
                choiceOne = true;
                choiceTwo = false;
                choiceThree = false;
              });
            }, choiceOne),
            reportRow(context, "The patient don't pick up", (value) {
              setState(() {
                choiceOne = false;
                choiceTwo = true;
                choiceThree = false;
              });
            }, choiceTwo),
            reportRow(context, "Can't connect with patient", (value) {
              setState(() {
                choiceOne = false;
                choiceTwo = false;
                choiceThree = true;
              });
            }, choiceThree),
            const SizedBox(height: 40),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: LocaleKeys.dontKeep.tr(),
                  style: h4(context: context),
                  children: <TextSpan>[
                    TextSpan(
                      text: LocaleKeys.youCan.tr(),
                      style: h4(context: context),
                    ),
                    TextSpan(
                      text: LocaleKeys.cancelRequest.tr(),
                      style: h4(color: dodgerBlue),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedCpn(
              function: () {
                Navigator.of(context).pop();
              },
              gradient: linear,
              textButton: LocaleKeys.consultLater.tr(),
              textStyle:
                  h5(color: Theme.of(context).color12, fontWeight: '700'),
            ),
          ],
        ),
      ),
    );
  }
}
