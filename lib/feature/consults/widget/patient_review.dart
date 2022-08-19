import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/patient_review_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PatientReview extends StatelessWidget {
  const PatientReview({Key? key, required this.review}) : super(key: key);

  final PatientReviewModel review;

  @override
  Widget build(BuildContext context) {
    List<String> rateRender = List<String>.filled(review.rate, icRateFull);
    return SectionBox(
        icon: icRate,
        title: LocaleKeys.reviewFromPatient.tr(),
        child: Column(
          children: [
            SizedBox(
              width: 40 * review.rate.toDouble(),
              height: 32,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ImageAsset(rateRender[index], width: 32, height: 32);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
                itemCount: review.rate,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              review.note,
              style: h4(context: context),
            ),
          ],
        ));
  }
}
