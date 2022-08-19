import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/question_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail(
      {Key? key,
      required this.description,
      this.avtDoctorCreated,
      required this.category,
      this.nameDoctorCreated,
      this.subTitle,
      this.questions})
      : super(key: key);
  final String description;
  final List<Map<String, dynamic>> category;
  final String? nameDoctorCreated;
  final String? avtDoctorCreated;
  final List<String>? subTitle;
  final List<QuestionModel>? questions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: h4(context: context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                LocaleKeys.createdBy.tr(),
                style: h7(context: context),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: ImageAsset(
                      avtDoctorCreated ?? avt1,
                      width: 48,
                      height: 48,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameDoctorCreated ?? 'Dr. Russell Chavez',
                        style: h5(color: dodgerBlue, fontWeight: '700')),
                    Text('Integrative Medicine', style: h7(context: context)),
                  ],
                )
              ],
            ),
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
            Text(
              LocaleKeys.relatedQuestions.tr(),
              style: h3(context: context, fontWeight: '700'),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How can air pollution effect health? What are the health effects of air pollution? ',
                      style: h3(context: context, fontWeight: '600'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          const ImageAsset(
                            icDoctorAnswer,
                            width: 16,
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '2',
                              style: h7(context: context, fontWeight: '700'),
                            ),
                          ),
                          Text(
                            LocaleKeys.doctorsAnswered.tr(),
                            style: h7(context: context),
                          ),
                        ],
                      ),
                    ),
                    AppWidget.divider2(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: const ImageAsset(
                                avt1,
                                width: 40,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 4, left: 12),
                              child: Text('Dr. Madge Oliver',
                                  style:
                                      h7(color: dodgerBlue, fontWeight: '700')),
                            ),
                            Text('answered', style: h7(context: context)),
                          ],
                        ),
                        const AnimationClick(
                            child: ImageAsset(icOption, color: grayBlue))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                      child: Image.asset(
                        tips[0].image,
                        width: double.infinity,
                        height: 176,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text('Question description', style: h6(context: context)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
