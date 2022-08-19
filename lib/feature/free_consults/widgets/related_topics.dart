import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/topic_detail.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class RelatedTopics extends StatelessWidget {
  const RelatedTopics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      title: LocaleKeys.relatedTopics.tr(),
      icon: icTopic,
      paddingHorizontal: 0,
      paddingChild: const EdgeInsets.all(0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return AnimationClick(
            function: () {
              Navigator.of(context).pushNamed(Routes.topicDetail,
                  arguments: TopicDetail(topicModel: topics[index]));
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: isabelline),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Text(
                topics[index].titleTopic,
                style: h4(color: dodgerBlue),
              ),
            ),
          );
        },
      ),
    );
  }
}
