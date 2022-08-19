import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';
import 'package:flutter_doctor_plus/common/widget/topic_item.dart';

class ListTopic extends StatelessWidget {
  const ListTopic({Key? key, required this.topics}) : super(key: key);
  final List<TopicModel> topics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        return TopicItem(topic: topics[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: topics.length,
    );
  }
}
