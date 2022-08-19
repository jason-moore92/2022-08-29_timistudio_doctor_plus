import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/util/format_time.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PatientProfileAppBar extends StatelessWidget {
  const PatientProfileAppBar(
      {Key? key, required this.controller, required this.patientModel})
      : super(key: key);
  final TabController controller;
  final PatientModel patientModel;

  Widget summary(String title, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: h8(color: grayBlue),
        ),
        Text(
          value,
          style: h3(context: context, fontWeight: '600', fontFamily: 'Oswald'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: height / 29 * 14,
      leading: const SizedBox(),
      backgroundColor: grey100,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 24),
        child: SizedBox(
          width: double.infinity,
          height: 64,
          child: TabBar(
            indicator: UnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).color11),
                insets: const EdgeInsets.symmetric(horizontal: 32)),
            isScrollable: true,
            controller: controller,
            labelColor: Theme.of(context).color11,
            unselectedLabelColor: grayBlue,
            labelStyle: h5(fontWeight: '700', context: context),
            unselectedLabelStyle: h5(fontWeight: '600', color: grayBlue),
            tabs: [
              Text(LocaleKeys.consultHistory.tr() + ' [15]'),
              Text(LocaleKeys.hisFamily.tr() + ' [2]'),
              Text(LocaleKeys.sharedRecords.tr()),
            ],
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox(
              height: height / 29 * 9,
              width: double.infinity,
              child: ImageAsset(navigationBar,
                  width: double.infinity, height: height / 29 * 9),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: height / 203 * 13,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonCpn(
                            iconColor: grey100,
                            hasOutline: false,
                            bgColor: black.withOpacity(0.2),
                            path: icBack,
                            function: () {
                              Navigator.of(context).pop();
                            }),
                        IconButtonCpn(
                            iconColor: grey100,
                            hasOutline: false,
                            bgColor: black.withOpacity(0.2),
                            path: icOption,
                            function: () {})
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: grey100,
                        boxShadow: [
                          BoxShadow(
                              color: color4.withOpacity(0.04),
                              offset: const Offset(0, 5),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageAsset(
                              patientModel.avatar,
                              width: 88,
                              height: 88,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    patientModel.name,
                                    style:
                                        h5(context: context, fontWeight: '700'),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          patientModel.isMale
                                              ? LocaleKeys.mle.tr()
                                              : LocaleKeys.femle.tr(),
                                          style: h7(context: context),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 2,
                                          height: 2,
                                          color: grayBlue,
                                        ),
                                        Text(
                                          '${DateTime.now().year - patientModel.dateOfBirth.year} ' +
                                              LocaleKeys.yearsOld.tr(),
                                          style: h7(context: context),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const ImageAsset(icDob,
                                          width: 16, height: 16),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          FormatTime.formatTime(
                                              format: Format.dMy,
                                              dateTime:
                                                  patientModel.dateOfBirth),
                                          style: h7(context: context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        const ImageAsset(icLocation16,
                                            width: 16, height: 16),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            patientDemo.place!,
                                            style: h7(context: context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                            height: 1,
                            margin: const EdgeInsets.only(top: 24, bottom: 16),
                            decoration: const BoxDecoration(
                              color: backgroundColor,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            summary(LocaleKeys.height.tr(),
                                '${patientDemo.height!.toInt()}cm', context),
                            summary(LocaleKeys.weight.tr(),
                                '${patientDemo.weight!.toInt()}kg', context),
                            summary(LocaleKeys.bmi.tr(), '${patientDemo.bmi}',
                                context),
                            summary(LocaleKeys.bloodType.tr(),
                                '${patientDemo.bloodType}', context),
                          ],
                        ),
                        Container(
                            height: 1,
                            margin: const EdgeInsets.only(top: 24, bottom: 16),
                            decoration: const BoxDecoration(
                              color: backgroundColor,
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const ImageAsset(
                                    icCall,
                                    color: neonFuchsia,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        patientModel.phone!,
                                        style: h7(
                                            color: dodgerBlue,
                                            fontWeight: '700'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const ImageAsset(
                                    icPayment,
                                    color: goGreen,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Spent \$2.563 used your service',
                                        style: h6(context: context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
