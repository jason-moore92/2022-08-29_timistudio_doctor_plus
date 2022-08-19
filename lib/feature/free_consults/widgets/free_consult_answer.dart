import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_answer_model.dart';
import 'package:flutter_doctor_plus/common/model/menu_option_model.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/menu_option_custom.dart';
import 'package:flutter_doctor_plus/common/widget/shadow_container.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/doctor_card.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'agreed_bottom.dart';

class FreeConsultAnswer extends StatelessWidget {
  const FreeConsultAnswer({Key? key, required this.answer}) : super(key: key);

  final FreeConsultAnswerModel answer;

  @override
  Widget build(BuildContext context) {
    bool isYours = answer.doctor.id == currentUser.id;
    bool isAgreed = answer.doctorsAgreed != null
        ? answer.doctorsAgreed
                ?.indexWhere((doctor) => doctor.id == currentUser.id) !=
            -1
        : false;

    List<DoctorModel> doctorsAgreed = answer.doctorsAgreed ?? [];
    int itemCount = doctorsAgreed.length < 3 ? doctorsAgreed.length : 3;

    return ShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DoctorCard(doctor: answer.doctor),
          const SizedBox(height: 16),
          answer.attachment != null
              ? ImageAsset(
                  answer.attachment!.image,
                  width: double.infinity,
                  height: 200,
                )
              : const SizedBox(),
          const SizedBox(height: 16),
          Text(
            answer.answer,
            style: h4(context: context),
          ),
          const SizedBox(height: 16),
          Text(
            '${answer.thanks} ${LocaleKeys.thanks.tr()}',
            style: h7(color: grayBlue),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuOptionCustom(
                childShowOption: IconButtonCpn(
                  path: icOption,
                  iconColor: grayBlue,
                  function: () {},
                  paddingAll: 11,
                ),
                childInside: [
                  MenuOptionModel(title: LocaleKeys.takePhoto.tr()),
                  MenuOptionModel(title: LocaleKeys.takeVideo.tr()),
                  MenuOptionModel(title: LocaleKeys.fromDoctorLibrary.tr()),
                  MenuOptionModel(title: LocaleKeys.fromPhotos.tr()),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: isYours
                    ? ElevatedCpn(
                        textButton: LocaleKeys.edit.tr(),
                        bgColor: tiffanyBlue,
                        leftWidget: const ImageAsset(
                          icEdit,
                          color: grey100,
                        ),
                      )
                    : isAgreed
                        ? ElevatedCpn(
                            textButton: LocaleKeys.agreed.tr(),
                            bgColor: grayBlue,
                            leftWidget: const ImageAsset(
                              icCheckmark,
                              color: grey100,
                            ),
                          )
                        : ElevatedCpn(
                            textButton: LocaleKeys.agree.tr(),
                            bgColor: tiffanyBlue,
                            leftWidget: const ImageAsset(
                              icThanks,
                              color: grey100,
                            ),
                          ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BottomCustom(
            childInside: AgreedBottom(
              doctors: doctorsAgreed,
            ),
            childShowBottom: Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: isabelline),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(
                        height: 24,
                        width: itemCount * 28,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ImageAsset(doctorsAgreed[index].avt);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 4);
                          },
                          itemCount: itemCount,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${doctorsAgreed.length} doctors agreed',
                        style: h7(color: grayBlue),
                      ),
                    ]),
                    const IconButtonCpn(
                      path: icArrowRight,
                      widthIcon: 16,
                      heightIcon: 16,
                      paddingAll: 0,
                      hasOutline: false,
                      iconColor: grayBlue,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
