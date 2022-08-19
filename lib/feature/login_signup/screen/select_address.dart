import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/custom_map.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({Key? key}) : super(key: key);

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
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
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
        appBar: AppBarCpn(
          size: Size(double.infinity, height / 29 * 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButtonCpn(
                        borderColor: border,
                        path: close,
                        function: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(
                      child: SearchCpn(
                        controller: searchCtl,
                        focusNode: searchFn,
                        iconPrefix: icPinMap,
                        hintText: LocaleKeys.enterAddress.tr(),
                      ),
                    )
                  ],
                ),
              ),
              AnimationClick(
                function: () {
                  Navigator.of(context).pop(LocaleKeys.myLocation.tr());
                },
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: IconButtonCpn(
                        hasOutline: false,
                        iconColor: grey100,
                        bgColor: mediumTurquoise,
                        path: icPinMap,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.useCurrentLocation.tr(),
                          style: h7(color: dodgerBlue, fontWeight: '700'),
                        ),
                        Text(
                          LocaleKeys.myLocation.tr(),
                          style: h4(context: context),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ElevatedCpn(
            function: () {
              Navigator.of(context).pop(LocaleKeys.myLocation.tr());
            },
            gradient: linear,
            textButton: LocaleKeys.chooseThisLocation.tr(),
            textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
          ),
        ),
        body: const CustomMap());
  }
}
