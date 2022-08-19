import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/widget/patient_card.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ListPatients extends StatelessWidget {
  const ListPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      paddingChild: const EdgeInsets.all(0),
      paddingHorizontal: 0,
      title: LocaleKeys.patients.tr(),
      icon: icAccount,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          if (index > 3) {
            return const SizedBox();
          }
          return const Divider();
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          if (index > 3) {
            return const SizedBox();
          }
          return PatientCard(
            patient: patients[index],
            hasMargin: false,
            hasOutline: false,
          );
        },
      ),
    );
  }
}
