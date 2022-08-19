import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/patient_card.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PatientManagement extends StatefulWidget {
  const PatientManagement({Key? key}) : super(key: key);

  @override
  State<PatientManagement> createState() => _PatientManagementState();
}

class _PatientManagementState extends State<PatientManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        right: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButtonCpn(
                  iconColor: dodgerBlue,
                  borderColor: dodgerBlue,
                  path: icSearch),
            ),
            IconButtonCpn(
                function: () {
                  Navigator.of(context).pushNamed(Routes.filter);
                },
                iconColor: dodgerBlue,
                borderColor: dodgerBlue,
                path: icFilter)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.patientManagement.tr() + ' [${patients.length}]',
                style: h1(context: context, fontWeight: '700')),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PatientCard(
                        patient: patients[index], hasMargin: false);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 40,
                    );
                  },
                  itemCount: patients.length),
            )
          ],
        ),
      ),
    );
  }
}
