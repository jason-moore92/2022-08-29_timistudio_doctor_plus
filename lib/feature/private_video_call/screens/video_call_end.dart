import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class VideoCallEnded extends StatelessWidget {
  const VideoCallEnded({Key? key, required this.patient}) : super(key: key);

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.callEnded.tr(),
                    style: h4(context: context),
                  ),
                  const SizedBox(height: 56),
                  ImageAsset(patient.avatar, width: 128, height: 128),
                  const SizedBox(height: 48),
                  Text(
                    patient.name,
                    style: h2(context: context, fontWeight: '700'),
                  ),
                  const SizedBox(height: 32),
                  OutlinedCpn(
                    function: () {
                      Navigator.of(context).pushReplacementNamed(Routes.home);
                    },
                    textButton: LocaleKeys.goDashboard.tr(),
                    textStyle: h5(color: grayBlue, fontWeight: '700'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedCpn(
                    function: () {
                      Navigator.of(context).pushNamed(Routes.writeAnAnswer);
                    },
                    gradient: linear,
                    textButton: LocaleKeys.writeAnswer.tr(),
                    textStyle: h5(color: grey100),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
