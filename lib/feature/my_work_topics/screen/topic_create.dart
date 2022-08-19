import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/text_field_2.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/widget/add_image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddTopic extends StatefulWidget {
  const AddTopic({Key? key}) : super(key: key);

  @override
  State<AddTopic> createState() => _AddTopicState();
}

class _AddTopicState extends State<AddTopic> {
  TextEditingController nameTopicCtl = TextEditingController();
  FocusNode nameTopicFn = FocusNode();
  TextEditingController someDetailCtl = TextEditingController();
  FocusNode someDetailFn = FocusNode();

  @override
  void dispose() {
    nameTopicCtl.dispose();
    nameTopicFn.dispose();
    someDetailCtl.dispose();
    someDetailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> category = [
      {'icon': icAdditionalInformation, 'title': LocaleKeys.overview.tr()},
      {
        'icon': icCondition,
        'title': LocaleKeys.conditionsSymptoms.tr(),
        'onTap': () {
          Navigator.of(context).pushNamed(Routes.topicAddCondition);
        }
      },
      {'icon': icMedication, 'title': LocaleKeys.medication.tr()},
      {'icon': icProcedure, 'title': 'Procedures'},
      {'icon': icHealthGuide, 'title': LocaleKeys.healthGuide.tr()}
    ];
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: close,
        center: Text(
          LocaleKeys.addNewTopic.tr(),
          style: h3(fontWeight: '700', context: context),
        ),
        right: AnimationClick(
          function: () {},
          child: Text(
            LocaleKeys.public.tr(),
            style: h5(fontWeight: '700', color: dodgerBlue),
          ),
        ),
      ),
      body: ListView(
        children: [
          AddImage(
            title: LocaleKeys.addTopicImage.tr(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: TextField2Cpn(
                      controller: nameTopicCtl,
                      focusNode: nameTopicFn,
                      hintText: LocaleKeys.enterTopic.tr(),
                    ),
                  ),
                  TextField2Cpn(
                      controller: someDetailCtl,
                      focusNode: someDetailFn,
                      hintStyle: h4(color: grayBlue),
                      hintText: LocaleKeys.tellPeople.tr(),
                      maxLength: 2000),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    margin: const EdgeInsets.symmetric(vertical: 40),
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
                            function: category[index]['onTap'] ?? () {},
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
