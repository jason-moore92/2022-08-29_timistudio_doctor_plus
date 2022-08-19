import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class CallEnded extends StatelessWidget {
  const CallEnded({Key? key, required this.patient}) : super(key: key);

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.callEnded.tr(),
                  style: h4(color: neonFuchsia),
                ),
                const SizedBox(height: 48),
                ImageAsset(patient.avatar, width: 128, height: 128),
                const SizedBox(height: 48),
                Text(
                  patient.name,
                  style: h2(context: context, fontWeight: '700'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: ElevatedCpn(
                    function: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.reportProblem);
                    },
                    gradient: linear,
                    textButton: LocaleKeys.reportCallProblem.tr(),
                    textStyle: h5(color: grey100),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
