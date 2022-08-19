import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/feature/search_special/widget/item_detail.dart';
import '../widget/medication_detail_appbar.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class MedicationDetail extends StatelessWidget {
  MedicationDetail({Key? key, required this.medicationModel}) : super(key: key);
  final MedicationModel medicationModel;

  final List<Map<String, String>> category = [
    {'icon': icAdditionalInformation, 'title': LocaleKeys.overview.tr()},
    {'icon': icAccount, 'title': LocaleKeys.usesFor.tr()},
    {'icon': icSideEffect, 'title': LocaleKeys.sideEffect.tr()},
    {'icon': icHealthGuide, 'title': LocaleKeys.healthGuide.tr()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            MedicationDetailAppBar(
              medicationModel: medicationModel,
            )
          ];
        },
        body: ItemDetail(
            description: medicationModel.description, category: category),
      ),
    );
  }
}
