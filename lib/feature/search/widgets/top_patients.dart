import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/patient_management/screen/patient_profile.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/title_row.dart';

class TopPatients extends StatelessWidget {
  const TopPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleRow(
          title: 'Top Patients',
          route: Routes.patientManagement,
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 124,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pushNamed(
                        Routes.patientProfile,
                        arguments:
                            PatientProfile(patientModel: patients[index]),
                      );
                    },
                    child: ImageAsset(
                      patients[index].avatar,
                      width: 64,
                      height: 64,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    patients[index].name,
                    style: h8(context: context),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 24,
              );
            },
            itemCount: patients.length,
          ),
        ),
      ],
    );
  }
}
