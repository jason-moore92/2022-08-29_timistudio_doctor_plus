import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SpecialHospitalDetail extends StatelessWidget {
  const SpecialHospitalDetail({Key? key, required this.hospitalModel})
      : super(key: key);
  final HospitalModel hospitalModel;

  Widget item(String path, String value, BuildContext context,
      {bool isPhone = false}) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButtonCpn(
              path: path,
              hasOutline: false,
              paddingAll: 4,
              iconColor: tiffanyBlue,
              bgColor: tiffanyBlue.withOpacity(0.16),
            )),
        Expanded(
          child: Text(value,
              style: isPhone
                  ? h5(color: dodgerBlue, fontWeight: '700')
                  : h5(context: context)),
        )
      ],
    );
  }

  Widget itemOverview(BuildContext context, String title, String value,
      {bool isWebsite = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(title,
              style: h4(
                context: context,
              )),
        ),
        Expanded(
          child: Text(value,
              style: isWebsite ? h4(color: dodgerBlue) : h4(context: context)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: height / 203 * 66,
          leading: const SizedBox(),
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return FlexibleSpaceBar(
                background: Stack(
                  children: [
                    ImageAsset(hospitalModel.imageBackground!,
                        width: double.infinity, height: height / 203 * 66),
                    Positioned(
                      left: 24,
                      right: 24,
                      top: height / 203 * 13,
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
                              path: share)
                        ],
                      ),
                    ),
                    Positioned(
                      left: 24,
                      bottom: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: grey100.withOpacity(0.06),
                              offset: const Offset(0, 2),
                              blurRadius: 4)
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: ImageAsset(hospitalModel.imageHospital!,
                              width: 80, height: 80),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      hospitalModel.name!,
                      style: h1(context: context, fontWeight: '700'),
                    ),
                  ),
                  item(icHospital, hospitalModel.address!, context),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: item(icCall, hospitalModel.phoneNumber!, context,
                        isPhone: true),
                  ),
                  item(icHospitalBed, '${hospitalModel.beds} beds', context),
                  Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 24),
                    child: Text(
                      LocaleKeys.overview.tr(),
                      style: h3(context: context, fontWeight: '700'),
                    ),
                  ),
                  itemOverview(
                      context, 'Type:', 'Nongovernment, Not-for-profit'),
                  itemOverview(context, 'System:', 'Continuum Health Partners'),
                  itemOverview(context, 'Website:', 'www.slrsurgery.org',
                      isWebsite: true),
                  Text(
                    'JCAHO Accredited',
                    style: h4(context: context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 48),
                    child: itemOverview(context, 'Warning:',
                        'Always call 911 in the case of emergency. Always call the hospital to confirm its location, hours of operation and services before heading to the hospital.'),
                  ),
                  Text(
                    LocaleKeys.services.tr(),
                    style: h3(context: context, fontWeight: '700'),
                  ),
                  ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(
                          services[index],
                          style: h4(context: context),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: services.length),
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }
}
