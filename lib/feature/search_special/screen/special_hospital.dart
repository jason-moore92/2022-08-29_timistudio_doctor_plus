import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/hospital_item.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SpecialHospital extends StatefulWidget {
  const SpecialHospital({Key? key}) : super(key: key);

  @override
  State<SpecialHospital> createState() => _SpecialHospitalState();
}

class _SpecialHospitalState extends State<SpecialHospital> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        center: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchCpn(
              onChanged: (value) {},
              controller: searchCtl,
              focusNode: searchFn,
              hintText: 'Enter name, speciality...',
            ),
          ),
        ),
        right: const IconButtonCpn(
            iconColor: dodgerBlue, borderColor: dodgerBlue, path: icNearby),
      ),
      body: Container(
        color: backgroundColor2,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: LocaleKeys.find.tr(),
                style: h4(context: context),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${hospitals.length} ',
                    style: h4(context: context, fontWeight: '700'),
                  ),
                  TextSpan(
                    text: LocaleKeys.hospitalAroundYou.tr(),
                    style: h4(context: context),
                  )
                ],
              ),
            ),
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  LocaleKeys.changeLocation.tr(),
                  style: h3(color: dodgerBlue, fontWeight: '600'),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return HospitalItem(hospitalModel: hospitals[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: hospitals.length),
            )
          ],
        ),
      ),
    );
  }
}
