import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/util/string.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/section_box.dart';
import 'package:flutter_doctor_plus/feature/search/widgets/list_doctors.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ListExpert extends StatelessWidget {
  const ListExpert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      paddingChild: const EdgeInsets.all(0),
      paddingHorizontal: 0,
      title: LocaleKeys.experts.tr().toCapitalized(),
      icon: icDoctor,
      child: ListDoctor(doctors: doctorsDemo),
    );
  }
}
