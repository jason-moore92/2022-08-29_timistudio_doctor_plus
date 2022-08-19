import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/past_consults.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'next_consults.dart';

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({Key? key}) : super(key: key);

  @override
  State<ConsultScreen> createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  void onSearch() {}

  void onCalendar() {}

  void onFilter() {
    Navigator.of(context).pushNamed(Routes.pastConsultsFilter);
  }

  bool isNext = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setState(() {
              isNext = tabController.index == 0;
            });
          }
        });
        return Scaffold(
            appBar: AppBarCpn(
              right: Row(
                children: [
                  IconButtonCpn(
                      function: onSearch,
                      path: icSearch,
                      iconColor: dodgerBlue,
                      borderColor: dodgerBlue),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: IconButtonCpn(
                        function: isNext ? onCalendar : onFilter,
                        path: isNext ? icCalendar : icFilter,
                        iconColor: dodgerBlue,
                        borderColor: dodgerBlue),
                  )
                ],
              ),
              bottom: TabBar(
                labelStyle: h1(context: context, fontWeight: '700'),
                unselectedLabelStyle: h3(context: context, fontWeight: '600'),
                labelColor: black,
                unselectedLabelColor: grayBlue,
                indicatorColor: black,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: LocaleKeys.todayConsult.tr()),
                  Tab(text: LocaleKeys.pastConsult.tr()),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                NextConsults(),
                PastConsults(),
              ],
            ));
      }),
    );
  }
}
