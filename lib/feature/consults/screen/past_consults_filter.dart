import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/consult_type.dart';
import 'package:flutter_doctor_plus/common/widget/have_consult.dart';
import 'package:flutter_doctor_plus/common/widget/sliding_segmented.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/consult_status.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class PastConsultsFilter extends StatefulWidget {
  const PastConsultsFilter({Key? key}) : super(key: key);

  @override
  State<PastConsultsFilter> createState() => _PastConsultsFilterState();
}

class _PastConsultsFilterState extends State<PastConsultsFilter>
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
        color: grey100,
        iconLeft: close,
        center: Text(
          LocaleKeys.filter.tr(),
          style: h3(
            context: context,
            fontWeight: '700',
          ),
        ),
        right: Text(
          LocaleKeys.resetAll.tr(),
          style: h5(
            color: dodgerBlue,
            fontWeight: '700',
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ElevatedCpn(
          function: () {},
          gradient: linear,
          textButton: LocaleKeys.show45.tr(),
          rightWidget: const Icon(
            Icons.arrow_right_alt_rounded,
            size: 24,
          ),
          textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                const ConsultStatus(),
                const SizedBox(height: 32),
                const ConsultType(),
                const SizedBox(height: 32),
                HaveConsult(title: LocaleKeys.dateRange.tr()),
                const SizedBox(height: 32),
                SlidingSegmented(
                  title: LocaleKeys.gender.tr(),
                  controlle: controlle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
