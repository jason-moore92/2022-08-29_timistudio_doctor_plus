import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';

import 'ripples_animation.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.subTitle,
      required this.textButton,
      required this.title})
      : super(key: key);
  final String icon;
  final String title;
  final String subTitle;
  final String textButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            RipplesAnimation(
              size: width / 75 * 32,
              color: const Color(0xFF020433),
              icon: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: h2(context: context, fontWeight: '700'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: h4(context: context),
              ),
            ),
            ElevatedCpn(
              function: onPressed,
              gradient: linear,
              textButton: textButton,
              textStyle:
                  h5(color: Theme.of(context).color12, fontWeight: '700'),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
