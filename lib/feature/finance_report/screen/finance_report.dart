import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/section_card.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class FinanceReport extends StatelessWidget {
  FinanceReport({Key? key}) : super(key: key);

  final List<Map<dynamic, dynamic>> sections = [
    {
      "name": LocaleKeys.incomeReport.tr(),
      "img": imgIncomeReport,
      "path": Routes.incomeReport
    },
    {
      "name": LocaleKeys.withdrawHistory.tr(),
      "img": imgWithdraw,
      'path': Routes.withDrawHistory
    }
  ];

  Widget component(BuildContext context, String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: h5(context: context),
        ),
        Text(
          price,
          style: h3(context: context, fontFamily: 'Oswald'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            LocaleKeys.financeReport.tr(),
            style: h1(fontWeight: '700', context: context),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(top: 40, bottom: 16),
            decoration: BoxDecoration(
              color: grey100,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  color: Color.fromRGBO(167, 115, 102, 0.16),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.balance.tr(),
                      style: h3(fontWeight: '700', context: context),
                    ),
                    AnimationClick(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              LocaleKeys.withdraw.tr(),
                              style: h7(fontWeight: '700', color: dodgerBlue),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 24,
                            color: grayBlue,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$ 2,490',
                      style: h0(context: context, fontFamily: 'Oswald'),
                    ),
                  ),
                ),
                AppWidget.divider2(),
                component(context, LocaleKeys.totalIncome.tr(), '\$ 42,490'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: component(context, 'Withdrew', '\$ 40,000'),
                ),
                component(context, LocaleKeys.incomeThisMonth.tr(), '\$ 2,490')
              ],
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              itemCount: sections.length,
              itemBuilder: (BuildContext ctx, index) {
                return SectionCard(
                  item: sections[index],
                );
              })
        ],
      ),
    );
  }
}
