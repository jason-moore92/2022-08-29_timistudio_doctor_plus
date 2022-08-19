import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/util/number_format.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';

import '../../feature/my_work_health_guide/screen/health_guide_detail.dart';
import '../route/routes.dart';
import 'image.dart';

enum Type { createdMe, lasted, healthTip, savedGuide }

class ItemTip extends StatelessWidget {
  const ItemTip(
      {Key? key,
      this.type = Type.lasted,
      required this.tipModel,
      this.hasClick = true})
      : super(key: key);
  final Type type;
  final TipModel tipModel;
  final bool hasClick;

  Widget title(BuildContext context) {
    switch (type) {
      case Type.createdMe:
      case Type.healthTip:
        return Text(
          tipModel.titleTip,
          style: h3(fontWeight: '600', context: context),
        );
      case Type.savedGuide:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageAsset(
              recommendedLabel,
              height: 16,
              width: 81,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 12),
              child: Text(
                tipModel.titleTip,
                style: h3(fontWeight: '600', context: context),
              ),
            ),
          ],
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health Tip',
              style: h7(context: context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 12),
              child: Text(
                tipModel.titleTip,
                style: h3(fontWeight: '600', context: context),
              ),
            ),
          ],
        );
    }
  }

  Widget footer(BuildContext context) {
    switch (type) {
      case Type.createdMe:
      case Type.savedGuide:
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            '${tipModel.enrolled} enrolled',
            style: h7(context: context),
          ),
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                tipModel.description!,
                style: h6(context: context),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    '${numberFormat.format(tipModel.thanks)} Thanks',
                    style: h6(color: grayBlue),
                  ),
                ),
                Text(
                  '${numberFormat.format(tipModel.shares)} Shares',
                  style: h6(color: grayBlue),
                ),
              ],
            )
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: color4.withOpacity(0.04),
            offset: const Offset(0, 5),
            blurRadius: 10)
      ], borderRadius: BorderRadius.circular(16), color: grey100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: title(context),
          ),
          AppWidget.divider2(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ImageAsset(
                        tipModel.avtDoctor,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4, left: 12),
                      child: Text(tipModel.nameDoctor,
                          style: h7(color: dodgerBlue, fontWeight: '700')),
                    ),
                    Text('shared', style: h7(context: context)),
                  ],
                ),
                const AnimationClick(
                    child: ImageAsset(icOption, color: grayBlue))
              ],
            ),
          ),
          AnimationClick(
            function: hasClick
                ? () {
                    Navigator.of(context).pushNamed(Routes.savedDetail,
                        arguments: HealthGuideDetail(tipModel: tipModel));
                  }
                : () {},
            child: Image.asset(
              tipModel.image,
              width: double.infinity,
              height: 176,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: footer(context))
        ],
      ),
    );
  }
}
