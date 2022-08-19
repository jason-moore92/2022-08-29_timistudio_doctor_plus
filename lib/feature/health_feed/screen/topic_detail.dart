import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/feature/health_feed/widget/topic_detail_app_bar.dart';
import 'package:flutter_doctor_plus/feature/search_special/widget/item_detail.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class TopicDetail extends StatelessWidget {
  const TopicDetail(
      {Key? key, required this.topicModel, this.isMyWorkTopicDetail = false})
      : super(key: key);
  final TopicModel topicModel;
  final bool isMyWorkTopicDetail;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> category = [
      {'icon': icAdditionalInformation, 'title': LocaleKeys.overview.tr()},
      {
        'icon': icCondition,
        'title': LocaleKeys.conditionsSymptoms.tr(),
        'onTap': () {
          Navigator.of(context).pushNamed(Routes.topicDetailConditions);
        }
      },
      {'icon': icMedication, 'title': LocaleKeys.medication.tr()},
      {'icon': icProcedure, 'title': 'Procedures'},
      {'icon': icHealthGuide, 'title': LocaleKeys.healthGuide.tr()}
    ];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            TopicDetailAppBar(
              topicModel: topicModel,
            )
          ];
        },
        body: ItemDetail(
            description: topicModel.description,
            category: category,
            avtDoctorCreated: topicModel.avtDoctor,
            nameDoctorCreated: topicModel.nameDoctor),
      ),
    );
  }
}
