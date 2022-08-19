import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';

class MedicationItem extends StatelessWidget {
  const MedicationItem({Key? key, required this.medication}) : super(key: key);

  final MedicationModel medication;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          medication.nameMedication,
          style: h5(context: context, fontWeight: '700'),
        ),
        const SizedBox(height: 12),
        Text(
          medication.description,
          style: h6(context: context),
        ),
      ],
    );
  }
}
