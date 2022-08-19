import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/menu_option_model.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/menu_option_custom.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'add_photo.dart';

class LibraryAppBar extends StatelessWidget {
  const LibraryAppBar(
      {Key? key,
      required this.controller,
      required this.photos,
      required this.documents,
      required this.videos})
      : super(key: key);
  final TabController controller;
  final int videos;
  final int photos;
  final int documents;

  Widget tabBar(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: Theme.of(context).color11),
            insets: const EdgeInsets.symmetric(horizontal: 32)),
        controller: controller,
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        labelColor: Theme.of(context).color11,
        unselectedLabelColor: grayBlue,
        labelStyle: h5(fontWeight: '700', context: context),
        unselectedLabelStyle: h5(fontWeight: '600', color: grayBlue),
        tabs: [
          Text(LocaleKeys.photos.tr() + " [$photos]"),
          Text(LocaleKeys.documents.tr() + " [$documents]"),
          Text(LocaleKeys.videos.tr() + " [$videos]")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: height / 7 * 1.8,
      leading: const SizedBox(),
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final bool check =
            MediaQuery.of(context).padding.top + kToolbarHeight ==
                constraints.biggest.height;
        return FlexibleSpaceBar(
          title: check ? tabBar(context) : const SizedBox(),
          titlePadding: EdgeInsets.only(
              top: 52, left: !check ? 24 : 0, right: !check ? 24 : 0),
          background: Padding(
            padding: const EdgeInsets.only(top: 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonCpn(
                          path: icBack,
                          function: () {
                            Navigator.of(context).pop();
                          }),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: IconButtonCpn(
                                iconColor: dodgerBlue,
                                borderColor: dodgerBlue,
                                path: icSearch),
                          ),
                          MenuOptionCustom(
                            childShowOption: const IconButtonCpn(
                                iconColor: dodgerBlue,
                                borderColor: dodgerBlue,
                                path: icPlus),
                            childInside: [
                              MenuOptionModel(
                                  title: LocaleKeys.takeAPhoto.tr(),
                                  function: () {
                                    BottomCustomController().show(
                                        context,
                                        backgroundColor,
                                        const AddPhoto(
                                          image: image3,
                                        ));
                                  }),
                              MenuOptionModel(
                                  title: LocaleKeys.takeAVideo.tr()),
                              MenuOptionModel(
                                  title: LocaleKeys.fromPhotos.tr()),
                              MenuOptionModel(title: LocaleKeys.others.tr()),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 32, left: 24, right: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.library.tr(),
                      style: h1(context: context, fontWeight: '700'),
                    ),
                  ),
                ),
                tabBar(context)
              ],
            ),
          ),
        );
      }),
    );
  }
}
