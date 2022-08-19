import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

class TipDetailAppBar extends StatelessWidget {
  const TipDetailAppBar({Key? key, required this.tipModel}) : super(key: key);
  final TipModel tipModel;
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
                              style: h3(context: context, fontWeight: '700'),
                            ),
                          ),
                        ),
                        const IconButtonCpn(
                            iconColor: dodgerBlue,
                            borderColor: dodgerBlue,
                            path: share)
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      tipModel.titleTip,
                      style: h2(context: context, fontWeight: '700'),
                    ),
                  ),
            titlePadding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            centerTitle: true,
            background: Stack(
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
                      IconButtonCpn(
                          iconColor: grey100,
                          hasOutline: false,
                          bgColor: black.withOpacity(0.2),
                          path: share)
                    ],
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
