import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/util/string.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class FreeConsultAppBar extends StatelessWidget {
  const FreeConsultAppBar(
      {Key? key,
      required this.controller,
      this.news = 0,
      this.answered = 0,
      this.following = 0})
      : super(key: key);

  final TabController controller;
  final int news;
  final int answered;
  final int following;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 2),
                color: Color.fromRGBO(0, 64, 128, 0.04),
              )
            ],
          ),
          width: double.infinity,
          height: 48,
          child: TabBar(
            controller: controller,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).color11,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 32),
            ),
            labelStyle: h5(context: context, fontWeight: '700'),
            unselectedLabelStyle: h5(context: context, fontWeight: '600'),
            labelColor: black,
            unselectedLabelColor: grayBlue,
            indicatorColor: black,
            indicatorWeight: 2,
            tabs: [
              Tab(text: LocaleKeys.news.tr().toCapitalized() + ' [$news]'),
              Tab(text: LocaleKeys.answered.tr() + ' [$answered]'),
              Tab(text: LocaleKeys.following.tr() + " [$following]"),
            ],
          ),
        ),
      ),
      pinned: true,
      elevation: 0,
      collapsedHeight: 120,
      expandedHeight: 188,
      leading: const SizedBox(),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool minSize = constraints.biggest.height ==
              MediaQuery.of(context).padding.top + kToolbarHeight + 64;
          return FlexibleSpaceBar(
            title: minSize
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonCpn(
                        path: icBack,
                        function: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        LocaleKeys.freeConsult.tr(),
                        textAlign: TextAlign.center,
                        style: h3(context: context, fontWeight: '700'),
                      ),
                      const IconButtonCpn(
                        path: icSearch,
                        iconColor: dodgerBlue,
                        borderColor: dodgerBlue,
                      )
                    ],
                  )
                : Text(
                    LocaleKeys.freeConsult.tr(),
                    style: h1(context: context, fontWeight: '700'),
                  ),
            centerTitle: false,
            titlePadding: const EdgeInsets.only(
              top: 0,
              left: 24,
              right: 24,
              bottom: 72,
            ),
            background: Container(
              decoration: BoxDecoration(
                color: minSize ? grey100 : backgroundColor3,
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButtonCpn(
                      path: icBack,
                      function: () {
                        Navigator.of(context).pop();
                      }),
                  IconButtonCpn(
                    function: () {},
                    path: icSearch,
                    iconColor: dodgerBlue,
                    borderColor: dodgerBlue,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
