import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class WithDrawHistory extends StatelessWidget {
  const WithDrawHistory({Key? key}) : super(key: key);

  Widget itemHistory(
      BuildContext context, String title, String subTitle, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                title,
                style: h5(fontWeight: '700', context: context),
              ),
            ),
            Text(
              subTitle,
              style: h7(color: grayBlue),
            ),
          ],
        ),
        Text(
          price,
          style: h5(context: context, fontFamily: 'Oswald'),
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
            LocaleKeys.withdrawHistory.tr(),
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
                      'Withdrew',
                      style: h3(fontWeight: '700', context: context),
                    ),
                    Text(
                      '\$ 40,000',
                      style: h0(context: context, fontFamily: 'Oswald'),
                    )
                  ],
                ),
                AppWidget.divider2(),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 24);
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: withDraws.length,
                  itemBuilder: (context, index) {
                    return itemHistory(
                        context,
                        withDraws[index].title,
                        withDraws[index].subTitle,
                        '\$ ${withDraws[index].price}');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
