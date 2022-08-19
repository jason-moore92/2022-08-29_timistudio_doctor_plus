import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';

import 'image.dart';

class TopicItem extends StatelessWidget {
  const TopicItem({Key? key, required this.topic}) : super(key: key);
  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: grey100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color.fromRGBO(0, 64, 128, 0.04),
          )
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ImageAsset(
                topic.image,
                width: double.infinity,
                height: 180,
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Text(
                  topic.titleTopic,
                  style: h3(color: grey100, fontWeight: '700'),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              ImageAsset(
                topic.avtDoctor,
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.nameDoctor,
                    style: h5(color: dodgerBlue, fontWeight: '700'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    topic.titleTopic,
                    style: h5(context: context),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              topic.description,
              style: h6(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
