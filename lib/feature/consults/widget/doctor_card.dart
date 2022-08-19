import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key, required this.doctor, this.showFull = false})
      : super(key: key);
  final DoctorModel doctor;
  final bool showFull;

  @override
  Widget build(BuildContext context) {
    Color onlineColor = doctor.isOnline ? malachite : grayBlue;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageAsset(
                      doctor.avt,
                      width: 64,
                      height: 64,
                    )),
              ),
              Positioned(
                top: 0,
                right: 7,
                child: Container(
                  width: 14,
                  height: 14,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: grey100,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: onlineColor.withOpacity(0.5),
                          blurRadius: 8,
                        )
                      ]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: onlineColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: h5(color: dodgerBlue, fontWeight: '700'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                doctor.specialities![0].nameSpec,
                style: h7(context: context),
              ),
            ),
            Row(
              children: [
                const ImageAsset(icRateFull, width: 16, height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    doctor.rate.toString(),
                    style: h7(context: context, fontWeight: '600'),
                  ),
                ),
                Text(
                  '(${doctor.reviews.toString()} ${LocaleKeys.reviews.tr()})',
                  style: h7(color: grayBlue),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
