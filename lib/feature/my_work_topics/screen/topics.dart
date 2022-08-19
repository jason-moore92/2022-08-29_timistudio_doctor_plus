import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import '../widget/topic_card.dart';
import '../widget/topics_app_bar.dart';

class Topics extends StatefulWidget {
  const Topics({Key? key}) : super(key: key);

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<TipModel> healthSaved = [];
  List<TipModel> healthCreatedMe = [];
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, value) => [
                TopicsAppBar(
                  controller: _controller,
                  created: healthGuidesCreatedByMe.length,
                  saved: healthGuidesCreatedByMe.length,
                )
              ],
          body: TabBarView(
            controller: _controller,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return TopicCard(topicModel: topics[index]);
                },
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return TopicCard(topicModel: topics[index]);
                },
              )
            ],
          )),
    );
  }
}
