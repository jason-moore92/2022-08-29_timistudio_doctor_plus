import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/item_tip.dart';

class ListTips extends StatelessWidget {
  const ListTips({Key? key, required this.tips}) : super(key: key);
  final List<TipModel> tips;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      shrinkWrap: true,
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return ItemTip(
          tipModel: tips[index],
          type: Type.healthTip,
        );
      },
    );
  }
}
