import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/patient_management/screen/patient_profile.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {Key? key,
      required this.patient,
      this.hasMargin = true,
      this.hasClose = false,
      this.hasOutline = true,
      this.color = grey100})
      : super(key: key);

  final PatientModel patient;
  final bool hasMargin;
  final bool hasClose;
  final bool hasOutline;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hasMargin ? 24 : 0),
      padding: const EdgeInsets.all(24),
      decoration: hasOutline
          ? BoxDecoration(
              color: color,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  color: Color.fromRGBO(0, 64, 128, 0.04),
                )
              ],
              borderRadius: BorderRadius.circular(16),
            )
          : const BoxDecoration(color: Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: ImageAsset(patient.avatar, width: 64, height: 64),
          ),
          AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(Routes.patientProfile,
                  arguments: PatientProfile(patientModel: patient));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(patient.name,
                    style: h4(context: context, fontWeight: '700')),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 8),
                  child: RichText(
                    text: TextSpan(
                      text: patient.isMale
                          ? LocaleKeys.mle.tr()
                          : LocaleKeys.femle.tr(),
                      style: h7(context: context, fontWeight: '600'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' - ',
                          style: h7(context: context),
                        ),
                        TextSpan(
                          text:
                              '${DateTime.now().year - patient.dateOfBirth.year} years old',
                          style: h7(context: context),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ImageAsset(icCall,
                        width: 16, height: 16, color: neonFuchsia),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        patient.phone ?? "0",
                        style: h7(context: context, fontWeight: '600'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: hasClose
                  ? const IconButtonCpn(
                      path: close,
                      hasOutline: false,
                      paddingAll: 4,
                      widthIcon: 7,
                      heightIcon: 7,
                      bgColor: grayBlue,
                      iconColor: grey100,
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
