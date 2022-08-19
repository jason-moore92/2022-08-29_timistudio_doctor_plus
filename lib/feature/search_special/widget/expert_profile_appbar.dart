import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/share_doctor_widget.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ExpertProfileAppBar extends StatelessWidget {
  const ExpertProfileAppBar(
      {Key? key,
      required this.controller,
      required this.doctorModel,
      this.isExpertProfile = true})
      : super(key: key);
  final TabController controller;
  final DoctorModel doctorModel;
  final bool isExpertProfile;

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: height / 29 * 15,
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
            tabs: isExpertProfile
                ? [
                    Text(LocaleKeys.about.tr()),
                    Text(LocaleKeys.insights.tr()),
                    Text(LocaleKeys.inNetwork.tr()),
                    Text(LocaleKeys.reviewsUper.tr()),
                  ]
                : [
                    Text(LocaleKeys.about.tr()),
                    Text(LocaleKeys.reviewsMyServices.tr()),
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
                        Row(
                          children: [
                            isExpertProfile
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: IconButtonCpn(
                                        iconColor: grey100,
                                        hasOutline: false,
                                        bgColor: black.withOpacity(0.2),
                                        path: icMyNetwork,
                                        function: () {}),
                                  )
                                : const SizedBox(),
                            IconButtonCpn(
                                iconColor: grey100,
                                hasOutline: false,
                                bgColor: black.withOpacity(0.2),
                                path: share,
                                function: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                        color: grey100,
                        boxShadow: [
                          BoxShadow(
                              color: color4.withOpacity(0.04),
                              offset: const Offset(0, 5),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(24)),
                    child: ShareDoctorWidget(
                        hasSummary: true, doctorModel: doctorModel),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: ElevatedCpn(
                      gradient: linear,
                      textButton: isExpertProfile
                          ? LocaleKeys.sendPrivateMessage.tr()
                          : LocaleKeys.updateWorkProfile.tr(),
                      leftWidget: ImageAsset(
                        isExpertProfile ? icCommentActive : icEdit,
                        color: grey100,
                      ),
                      textStyle: h5(
                          color: Theme.of(context).color12, fontWeight: '700'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
