import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import '../../../app/widget_support.dart';
import '../../../common/util/animation_calling.dart';
import 'call_ended.dart';

class OngoingCall extends StatefulWidget {
  const OngoingCall({Key? key, required this.patient}) : super(key: key);

  final PatientModel patient;

  @override
  State<OngoingCall> createState() => _OngoingCallState();
}

class _OngoingCallState extends State<OngoingCall> {
  Widget iconColumn(String icon, Color bgColor, Color iconColor, String title,
      Function() function) {
    return Column(
      children: [
        IconButtonCpn(
          function: function,
          path: icon,
          bgColor: bgColor,
          iconColor: iconColor,
          borderRadius: 16,
          paddingAll: 12,
          widthIcon: 32,
          heightIcon: 32,
          hasOutline: false,
        ),
        const SizedBox(height: 12),
        Text(title, style: h6(color: grayBlue)),
      ],
    );
  }

  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    final double width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ongoing call ...',
                  style: h4(context: context),
                ),
                AnimationCalling(
                    size: width / 75 * 68,
                    color: neonFuchsia,
                    icon: widget.patient.avatar,
                    heightIcon: 120,
                    widthIcon: 120),
                Text(
                  widget.patient.name,
                  style: h2(context: context, fontWeight: '700'),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: MediaQuery.of(context).padding.bottom + 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconColumn(isMuted ? icMute : icInterview, isabelline, grayBlue,
                    isMuted ? LocaleKeys.unmute.tr() : LocaleKeys.mute.tr(),
                    () {
                  setState(() {
                    isMuted = !isMuted;
                  });
                }),
                iconColumn(
                    icCallOff, neonFuchsia, grey100, LocaleKeys.cancel.tr(),
                    () {
                  Navigator.of(context).pushReplacementNamed(Routes.callEnded,
                      arguments: CallEnded(patient: widget.patient));
                }),
                iconColumn(icLiveChat, malachite, grey100,
                    LocaleKeys.textChat.tr(), () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
