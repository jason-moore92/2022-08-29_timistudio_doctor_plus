import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/menu_option_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/item_tip.dart';
import 'package:flutter_doctor_plus/common/widget/item_topic.dart';
import 'package:flutter_doctor_plus/common/widget/menu_option_custom.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/tip_detail.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class HealthFeed extends StatelessWidget {
  const HealthFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
          right: Row(
        children: [
          const IconButtonCpn(
              path: icSearch, iconColor: dodgerBlue, borderColor: dodgerBlue),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: MenuOptionCustom(
              childShowOption: IconButtonCpn(
                  function: () {},
                  path: icPlus,
                  iconColor: dodgerBlue,
                  borderColor: dodgerBlue),
              childInside: [
                MenuOptionModel(title: LocaleKeys.createHealthTip.tr()),
                MenuOptionModel(title: LocaleKeys.createHealthGuide.tr()),
                MenuOptionModel(title: LocaleKeys.createTopic.tr())
              ],
            ),
          )
        ],
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 5,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return ItemTopic(topicModel: topics[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 24,
                    );
                  },
                  itemCount: topics.length),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, bottom: 24, left: 24),
              child: Text(
                'The Latest',
                style: h3(fontWeight: '700', context: context),
              ),
            ),
            AnimationClick(
              function: () {
                Navigator.of(context).pushNamed(Routes.tipDetail,
                    arguments: TipDetail(tipModel: tips[0]));
              },
              child: ItemTip(
                tipModel: tips[0],
              ),
            )
          ],
        ),
      ),
    );
  }
}
