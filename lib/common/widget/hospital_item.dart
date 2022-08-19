import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/special_hospital_detail.dart';

class HospitalItem extends StatelessWidget {
  const HospitalItem({Key? key, required this.hospitalModel}) : super(key: key);
  final HospitalModel hospitalModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: color4.withOpacity(0.04),
                offset: const Offset(0, 5),
                blurRadius: 10)
          ], color: grey100, borderRadius: BorderRadius.circular(16)),
          child: AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(Routes.hospitalDetail,
                  arguments:
                      SpecialHospitalDetail(hospitalModel: hospitalModel));
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24, bottom: 8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ImageAsset(
                            hospitalModel.imageHospital!,
                            width: 64,
                            height: 64,
                          )),
                    ),
                    Text(
                      '${hospitalModel.distance} mil',
                      style: h7(context: context),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hospitalModel.name!,
                        style: h5(color: dodgerBlue, fontWeight: '700'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          hospitalModel.address!,
                          style: h7(context: context),
                        ),
                      ),
                      Row(
                        children: [
                          const ImageAsset(icRateFull, width: 16, height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              hospitalModel.rate.toString(),
                              style: h7(context: context, fontWeight: '600'),
                            ),
                          ),
                          Text(
                            '(${hospitalModel.reviews} reviews)',
                            style: h7(color: grayBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
