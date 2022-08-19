import 'package:flutter/cupertino.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/section_card.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class MyWork extends StatelessWidget {
  MyWork({Key? key}) : super(key: key);

  final List<Map<dynamic, dynamic>> sections = [
    {
      "name": LocaleKeys.financeReport.tr(),
      "img": imgFinanceReport,
      "path": Routes.financeReport
    },
    {
      "name": LocaleKeys.topics.tr(),
      "img": imgHealthFeed,
      'path': Routes.topics
    },
    {
      "name": LocaleKeys.healthGuide.tr(),
      "img": imgHealthGuide,
      "path": Routes.healthGuide
    },
    {
      "name": LocaleKeys.healthTips.tr(),
      "img": imgHealthTip,
      "path": Routes.healthTip
    },
    {
      "name": LocaleKeys.myNetwork.tr(),
      "img": imgCareTeam,
      "path": Routes.myNetwork
    },
    {
      "name": LocaleKeys.library.tr(),
      "img": imgLibrary,
      'path': Routes.library
    },
    {
      "name": LocaleKeys.servicesManagement.tr(),
      "img": imgConsultMange,
      "path": Routes.serviceManagement
    },
    {
      "name": LocaleKeys.workProfileManagement.tr(),
      "img": imgWorkProfile,
      "path": Routes.profileManagement
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 64, left: 24, right: 24),
      children: [
        Text(
          LocaleKeys.myWork.tr(),
          style: h1(fontWeight: '700', context: context),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.clinicStatus.tr(),
                style: h5(fontWeight: '700', context: context),
              ),
              CupertinoSwitch(value: true, onChanged: (value) async {})
            ],
          ),
        ),
        GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 24),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemCount: sections.length,
            itemBuilder: (BuildContext ctx, index) {
              return SectionCard(
                item: sections[index],
              );
            })
      ],
    );
  }
}
