import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/sliding_segmented.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/login_signup/widget/search_result.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class DoctorFilter extends StatefulWidget {
  const DoctorFilter({Key? key}) : super(key: key);

  @override
  State<DoctorFilter> createState() => _DoctorFilterState();
}

class _DoctorFilterState extends State<DoctorFilter>
    with TickerProviderStateMixin {
  TextEditingController specialitiesCtl = TextEditingController();
  FocusNode specialitiesFn = FocusNode();
  TextEditingController languageCtl = TextEditingController();
  FocusNode languageFn = FocusNode();
  late TabController tabCtl = TabController(length: 3, vsync: this);
  TextEditingController nearbyCtl = TextEditingController();
  FocusNode nearbyFn = FocusNode();

  @override
  void dispose() {
    specialitiesCtl.dispose();
    specialitiesFn.dispose();
    languageCtl.dispose();
    languageFn.dispose();
    nearbyCtl.dispose();
    nearbyFn.dispose();
    super.dispose();
  }

  void chooseGender(int value) {
    setState(() {
      tabCtl.index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBarCpn(
          color: grey100,
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
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: grey100),
          padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom),
          child: ElevatedCpn(
            function: () {
              Navigator.of(context).pop();
            },
            gradient: linear,
            textButton: LocaleKeys.show45.tr(),
            textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SearchResult(
                labelStyle: h5(fontWeight: '700', context: context),
                searchCtl: specialitiesCtl,
                searchFn: specialitiesFn,
                label: LocaleKeys.specialities.tr(),
                colorPrefixIcon: grayBlue,
                labels: const [
                  "Radiation Oncology",
                  "Urology",
                ],
              ),
              const SizedBox(height: 40),
              TextFieldCpn(
                labelStyle: h5(fontWeight: '700', context: context),
                controller: nearbyCtl,
                focusNode: nearbyFn,
                labelText: 'Nearby Me',
                showPrefixIcon: true,
                prefixIcon: icPinMap,
                colorPrefixIcon: grayBlue,
                hintText: LocaleKeys.enterAddress.tr(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    activeColor: tiffanyBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: dodgerBlue),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Text(
                    'Nearby me',
                    style: h4(context: context, fontWeight: '600'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SearchResult(
                labelStyle: h5(fontWeight: '700', context: context),
                searchCtl: languageCtl,
                searchFn: languageFn,
                label: LocaleKeys.language.tr(),
                colorPrefixIcon: grayBlue,
              ),
              const SizedBox(height: 40),
              SlidingSegmented(
                title: LocaleKeys.gender.tr(),
                controlle: tabCtl,
                onTap: chooseGender,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    activeColor: tiffanyBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: dodgerBlue),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Text(
                    'On My Network',
                    style: h4(context: context, fontWeight: '600'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
