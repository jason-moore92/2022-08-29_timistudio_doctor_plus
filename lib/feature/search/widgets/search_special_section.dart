import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/util/string.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/feature/live_chat/screen/share_medication.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/title_row.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SearchSpecialSection extends StatelessWidget {
  const SearchSpecialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> category = [
      {
        'icon': icDoctor,
        'title': LocaleKeys.experts.tr().toCapitalized(),
        'route': Routes.searchDoctor
      },
      {
        'icon': icCondition,
        'title': LocaleKeys.conditionsSymptoms.tr(),
        'route': Routes.searchCondition
      },
      {
        'icon': icMedication,
        'title': LocaleKeys.medication.tr(),
        'route': Routes.shareMedication
      },
      {
        'icon': icProcedure,
        'title': LocaleKeys.procedures.tr(),
      },
      {
        'icon': icHospital,
        'title': LocaleKeys.hospitals.tr(),
        'route': Routes.specialHospital
      },
    ];
    return Column(
      children: [
        const TitleRow(
          title: 'Search Special',
          isSimple: true,
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 2),
                color: Color.fromRGBO(0, 64, 128, 0.04),
              )
            ],
            color: grey100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 24),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimationClick(
                  function: () {
                    if (category[index]['route'] != null) {
                      if (category[index]['route'] == Routes.shareMedication) {
                        Navigator.of(context).pushNamed(
                            category[index]['route'],
                            arguments: const ShareMedication(hasShare: false));
                      } else {
                        Navigator.of(context)
                            .pushNamed(category[index]['route']);
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButtonCpn(
                            path: category[index]['icon']!,
                            hasOutline: false,
                            paddingAll: 8,
                            iconColor: grey100,
                            bgColor: tiffanyBlue,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(category[index]['title']!,
                                style: h5(context: context)),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 24,
                        color: grayBlue,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 32,
                );
              },
              itemCount: category.length),
        ),
      ],
    );
  }
}
