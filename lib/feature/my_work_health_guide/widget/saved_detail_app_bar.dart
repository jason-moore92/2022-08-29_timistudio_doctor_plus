import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class SavedDetailAppBar extends StatelessWidget {
  const SavedDetailAppBar(
      {Key? key, required this.tipModel, this.isSaved = false})
      : super(key: key);
  final TipModel tipModel;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: height / 203 * 70,
      leading: const SizedBox(),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double top = constraints.biggest.height;
          return FlexibleSpaceBar(
            title: top == MediaQuery.of(context).padding.top + kToolbarHeight
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonCpn(
                            path: icBack,
                            function: () {
                              Navigator.of(context).pop();
                            }),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text(
                              tipModel.titleTip,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: h3(context: context, fontWeight: '700'),
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: IconButtonCpn(
                                  iconColor: dodgerBlue,
                                  borderColor: dodgerBlue,
                                  path: icFollowed),
                            ),
                            IconButtonCpn(
                                iconColor: dodgerBlue,
                                borderColor: dodgerBlue,
                                path: share)
                          ],
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            centerTitle: true,
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ImageAsset(tipModel.image,
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
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: IconButtonCpn(
                                      iconColor: grey100,
                                      hasOutline: false,
                                      bgColor: dodgerBlue,
                                      path: icFollowed),
                                ),
                                IconButtonCpn(
                                    iconColor: grey100,
                                    hasOutline: false,
                                    bgColor: black.withOpacity(0.2),
                                    path: share)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8, left: 24),
                  child: ImageAsset(
                    recommendedLabel,
                    height: 16,
                    width: 81,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    tipModel.titleTip,
                    style: h1(context: context, fontWeight: '700'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
