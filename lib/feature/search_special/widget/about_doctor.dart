import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/custom_map.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key, required this.doctorModel, this.hasEdit = false})
      : super(key: key);
  final DoctorModel doctorModel;
  final bool hasEdit;

  Widget itemSpecialities(String icon, String text, BuildContext context,
      {bool isTitle = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButtonCpn(
          path: icon,
          hasOutline: false,
          paddingAll: !isTitle ? 8 : 4,
          iconColor: !isTitle ? grey100 : tiffanyBlue,
          bgColor: !isTitle ? tiffanyBlue : tiffanyBlue.withOpacity(0.16),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(text, style: h5(context: context, fontWeight: '700')),
        ),
      ],
    );
  }

  Widget itemExperience(String title, String answer, BuildContext context,
      {bool reverse = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: !reverse
                ? h7(context: context)
                : h5(context: context, fontWeight: '700')),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(answer,
              style: !reverse
                  ? h5(context: context, fontWeight: '700')
                  : h7(color: grayBlue)),
        ),
      ],
    );
  }

  Widget editInfo(Widget child, {Function? function}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        child,
        hasEdit
            ? AnimationClick(
                function: function,
                child: const ImageAsset(
                  icBase,
                ),
              )
            : const SizedBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      children: [
        Text(
          LocaleKeys.basicInformation.tr(),
          style: h3(context: context, fontWeight: '700'),
        ),
        Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: grey100, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              editInfo(
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButtonCpn(
                        path: icDoctor,
                        hasOutline: false,
                        paddingAll: 4,
                        bgColor: tiffanyBlue.withOpacity(0.16),
                        iconColor: tiffanyBlue,
                      ),
                    ),
                    Text(
                      LocaleKeys.aboutMe.tr(),
                      style: h5(context: context, fontWeight: '700'),
                    ),
                  ],
                ),
              ),
              AppWidget.divider2(),
              RichText(
                text: TextSpan(
                  text: doctorModel.aboutMe,
                  style: h6(context: context),
                  children: <TextSpan>[
                    TextSpan(
                      text: LocaleKeys.readMore.tr(),
                      style: h7(
                          context: context,
                          fontWeight: '600',
                          color: dodgerBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: grey100, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                  height: 200,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                      child: CustomMap())),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: editInfo(
                        Text(
                          doctorModel.place,
                          style: h5(context: context),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const ImageAsset(
                          icCall,
                          color: neonFuchsia,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              doctorModel.phone!,
                              style: h7(color: dodgerBlue, fontWeight: '700'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: Text(
                        LocaleKeys.insurancePlans.tr(),
                        style: h7(context: context, fontWeight: '700'),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, _) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: doctorModel.insurance!.length,
                      itemBuilder: (context, index) {
                        return Text(
                          doctorModel.insurance![index],
                          style: h5(context: context),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            LocaleKeys.myWorkExperience.tr(),
            style: h3(context: context, fontWeight: '700'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: grey100, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              editInfo(
                itemSpecialities(
                    icHealthNormal, LocaleKeys.specialities.tr(), context,
                    isTitle: true),
              ),
              AppWidget.divider2(),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return itemSpecialities(
                        doctorModel.specialities![index].icon!,
                        doctorModel.specialities![index].nameSpec,
                        context);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                  itemCount: doctorModel.specialities!.length)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 24, bottom: 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: grey100, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              editInfo(
                itemSpecialities(icExp, LocaleKeys.experience.tr(), context,
                    isTitle: true),
              ),
              AppWidget.divider2(),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return itemExperience(doctorModel.experience![index].title,
                        doctorModel.experience![index].answer, context);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                  itemCount: doctorModel.experience!.length)
            ],
          ),
        ),
        Text(
          LocaleKeys.eduCerti.tr(),
          style: h3(context: context, fontWeight: '700'),
        ),
        Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: grey100, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              editInfo(
                itemSpecialities(icEdu, LocaleKeys.education.tr(), context,
                    isTitle: true),
              ),
              AppWidget.divider2(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(LocaleKeys.medicalSchool.tr(),
                        style: h7(context: context)),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child:
                            ImageAsset(medicalSchoolExp, width: 56, height: 56),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorModel.education![0].medicalSchool!,
                              style: h5(context: context, fontWeight: '700'),
                            ),
                            Text(
                              doctorModel.education![0].year!,
                              style: h7(color: grayBlue),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(LocaleKeys.education.tr(),
                        style: h7(context: context)),
                  ),
                  Text(doctorModel.education![0].educated!,
                      style: h5(context: context, fontWeight: '700')),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(LocaleKeys.certification.tr(),
                        style: h7(context: context)),
                  ),
                  Text(doctorModel.education![0].degree!,
                      style: h5(context: context, fontWeight: '700')),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 14, bottom: 48),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: grey100, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              editInfo(
                itemSpecialities(
                    icCertification, LocaleKeys.cerAwards.tr(), context,
                    isTitle: true),
              ),
              AppWidget.divider2(),
              ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return itemExperience(doctorModel.certiAward![index].title,
                        doctorModel.certiAward![index].time, context,
                        reverse: true);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                  itemCount: doctorModel.certiAward!.length)
            ],
          ),
        ),
      ],
    );
  }
}
