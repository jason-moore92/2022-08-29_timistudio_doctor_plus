import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/consult_type.dart';
import 'package:flutter_doctor_plus/common/widget/have_consult.dart';
import 'package:flutter_doctor_plus/common/widget/slider.dart';
import 'package:flutter_doctor_plus/common/widget/sliding_segmented.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PatientFilter extends StatefulWidget {
  const PatientFilter({Key? key}) : super(key: key);

  @override
  State<PatientFilter> createState() => _PatientFilterState();
}

class _PatientFilterState extends State<PatientFilter>
    with SingleTickerProviderStateMixin {
  late TabController controlle;

  @override
  void initState() {
    controlle = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: close,
        center: Text(
          LocaleKeys.filter.tr(),
          style: h3(fontWeight: '700', context: context),
        ),
        right: AnimationClick(
          child: Text(
            LocaleKeys.resetAll.tr(),
            style: h4(fontWeight: '700', color: dodgerBlue),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ElevatedCpn(
          function: () {
            Navigator.of(context).pop();
          },
          gradient: linear,
          textButton: LocaleKeys.show45.tr(),
          textStyle: h5(color: grey100, fontWeight: '700'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 48),
                child: SliderCpn(
                  title: LocaleKeys.age.tr(),
                ),
              ),
              SlidingSegmented(
                  title: LocaleKeys.gender.tr(), controlle: controlle),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: SliderCpn(
                  min: 0,
                  max: 8000,
                  title: LocaleKeys.spentService.tr() + " (\$)",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: ConsultType(),
              ),
              const HaveConsult()
            ],
          ),
        ),
      ),
    );
  }
}
