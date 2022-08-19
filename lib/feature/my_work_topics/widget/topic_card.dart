import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';

import '../../../common/route/routes.dart';
import '../../health_feed/screen/topic_detail.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({Key? key, required this.topicModel}) : super(key: key);
  final TopicModel topicModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: color4.withOpacity(0.04),
              offset: const Offset(0, 5),
              blurRadius: 10)
        ],
        color: grey100,
      ),
      child: Column(
        children: [
          AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(Routes.topicDetail,
                  arguments: TopicDetail(
                      topicModel: topicModel, isMyWorkTopicDetail: true));
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: ImageAsset(
                    topicModel.image,
                    height: 176,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    topicModel.titleTopic,
                    style: h3(color: grey100, fontWeight: '600'),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: ImageAsset(
                          topicModel.avtDoctor,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(topicModel.nameDoctor,
                            style: h5(color: dodgerBlue, fontWeight: '700')),
                        Text('Integrative Medicine',
                            style: h7(context: context)),
                      ],
                    )
                  ],
                ),
                AppWidget.divider2(),
                Text(
                  topicModel.description,
                  style: h6(context: context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
