import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class TopicsAppBar extends StatelessWidget {
  const TopicsAppBar(
      {Key? key,
      required this.controller,
      required this.created,
      required this.saved})
      : super(key: key);
  final TabController controller;
  final int created;
  final int saved;

  Widget tabBar(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: Theme.of(context).color11),
            insets: const EdgeInsets.symmetric(horizontal: 32)),
        controller: controller,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        labelColor: Theme.of(context).color11,
        unselectedLabelColor: grayBlue,
        labelStyle: h5(fontWeight: '700', context: context),
        unselectedLabelStyle: h5(fontWeight: '600', color: grayBlue),
        tabs: [
          Text(LocaleKeys.createdByMe.tr() + " [5]"),
          Text(LocaleKeys.followingTopics.tr() + " [12]")
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
        final double top = constraints.biggest.height;
        return FlexibleSpaceBar(
          title: top == MediaQuery.of(context).padding.top + kToolbarHeight
              ? tabBar(context)
              : const SizedBox(),
          titlePadding: const EdgeInsets.only(top: 52, left: 24, right: 24),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: IconButtonCpn(
                                function: () {},
                                iconColor: dodgerBlue,
                                borderColor: dodgerBlue,
                                path: icSearch),
                          ),
                          IconButtonCpn(
                              function: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.createTopic);
                              },
                              iconColor: dodgerBlue,
                              borderColor: dodgerBlue,
                              path: icPlus)
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
                      'Topics',
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
