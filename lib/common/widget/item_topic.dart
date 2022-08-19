import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/topic_detail.dart';

class ItemTopic extends StatelessWidget {
  const ItemTopic({Key? key, required this.topicModel}) : super(key: key);
  final TopicModel topicModel;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: color4.withOpacity(0.04),
            offset: const Offset(0, 5),
            blurRadius: 10)
      ], borderRadius: BorderRadius.circular(16), color: grey100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(Routes.topicDetail,
                  arguments: TopicDetail(topicModel: topicModel));
            },
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      topicModel.image,
                      height: height / 7,
                      width: 224,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    left: 12,
                    bottom: 12,
                    child: Text(
                      topicModel.titleTopic,
                      style: h7(fontWeight: '700', color: grey100),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ImageAsset(topicModel.avtDoctor)),
                ),
                Text(
                  topicModel.nameDoctor,
                  style: h7(fontWeight: '700', context: context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
