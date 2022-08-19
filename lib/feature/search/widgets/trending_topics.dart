import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/item_topic.dart';

import 'title_row.dart';

class TrendingTopics extends StatelessWidget {
  const TrendingTopics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Column(
      children: [
        topics.isEmpty
            ? const SizedBox()
            : const TitleRow(
                title: 'Trending Topics',
                route: Routes.search,
              ),
        const SizedBox(height: 24),
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
            itemCount: topics.length,
          ),
        ),
      ],
    );
  }
}
