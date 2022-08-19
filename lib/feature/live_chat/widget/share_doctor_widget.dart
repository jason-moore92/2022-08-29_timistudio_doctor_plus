import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/util/number_format.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import '../../../common/route/routes.dart';
import '../../search_special/screen/expert_profile.dart';
import 'mess_widget.dart';

class ShareDoctorWidget extends StatelessWidget {
  const ShareDoctorWidget(
      {Key? key,
      this.message,
      this.doctorModel,
      this.hasSummary = false,
      this.hasClick = false})
      : super(key: key);
  final Map<String, dynamic>? message;
  final DoctorModel? doctorModel;
  final bool hasSummary;
  final bool hasClick;

  Widget summary(String title, int value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            title,
            style: h8(color: grayBlue),
          ),
        ),
        Text(
          numberFormat.format(value),
          style: h3(context: context, fontFamily: 'Oswald'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Column(
      crossAxisAlignment:
          message != null ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        message != null ? MessWidget(message: message!) : const SizedBox(),
        Container(
          width: message != null ? width / 4 * 3 : double.infinity,
          padding: EdgeInsets.all(message != null ? 16 : 24),
          decoration: BoxDecoration(
              color: grey100,
              borderRadius: message != null
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))
                  : BorderRadius.circular(16)),
          child: Column(
            children: [
              AnimationClick(
                function: hasClick
                    ? () {
                        Navigator.of(context).pushNamed(Routes.expertProfile,
                            arguments:
                                ExpertProfile(doctorModel: doctorModel!));
                      }
                    : () {},
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: message != null ? 0 : 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: message != null ? 8 : 0,
                                bottom: message != null ? 0 : 8),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: message != null ? 12 : 0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: ImageAsset(
                                        doctorModel!.avt,
                                        width: hasSummary ? 88 : 64,
                                        height: hasSummary ? 88 : 64,
                                      )),
                                ),
                                Positioned(
                                  top: 0,
                                  right: message != null ? 5 : -5,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        color: malachite,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                          BoxShadow(
                                              color: malachite.withOpacity(0.5),
                                              blurRadius: 8)
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          message != null
                              ? const SizedBox()
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: ImageAsset(icMyNetwork,
                                            width: 12, height: 12),
                                      ),
                                      Text(
                                        LocaleKeys.myNetwork.tr().toUpperCase(),
                                        style: h10(
                                            color: grey100,
                                            fontWeight: '700',
                                            fontFamily: 'Oswald'),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorModel!.name,
                          style: h5(color: dodgerBlue, fontWeight: '700'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            doctorModel!.specialities![0].nameSpec,
                            style: h7(context: context),
                          ),
                        ),
                        Row(
                          children: [
                            const ImageAsset(icRateFull, width: 16, height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                doctorModel!.rate.toString(),
                                style: h7(context: context, fontWeight: '600'),
                              ),
                            ),
                            Text(
                              '(${doctorModel!.reviews} reviews)',
                              style: h7(color: grayBlue),
                            ),
                          ],
                        ),
                        message != null
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  doctorModel!.place,
                                  style: h7(context: context),
                                ),
                              ),
                      ],
                    )
                  ],
                ),
              ),
              hasSummary ? AppWidget.divider2() : const SizedBox(),
              hasSummary
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        summary(LocaleKeys.patients.tr(), doctorModel!.patients,
                            context),
                        summary(LocaleKeys.savedLives.tr(),
                            doctorModel!.savedLives, context),
                        summary(LocaleKeys.helpedPeople.tr(),
                            doctorModel!.helpedPeople, context),
                        summary(LocaleKeys.thanksFor.tr(),
                            doctorModel!.thanksFor, context),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}
