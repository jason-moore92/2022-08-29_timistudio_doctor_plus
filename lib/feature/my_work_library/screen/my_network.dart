import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/share_doctor_widget.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class MyNetwork extends StatelessWidget {
  const MyNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
        iconLeft: icBack,
        right: IconButtonCpn(
            iconColor: dodgerBlue, borderColor: dodgerBlue, path: icSearch),
      ),
      floatingActionButton: IconButtonCpn(
          path: icFilter,
          bgColor: orange,
          function: () {
            Navigator.of(context).pushNamed(Routes.doctorFilter);
          },
          paddingAll: 16,
          hasOutline: false,
          iconColor: grey100),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.myNetwork.tr(),
              style: h3(context: context, fontWeight: '700'),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ShareDoctorWidget(
                      doctorModel: doctorsDemo[index],
                      hasClick: true,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: doctorsDemo.length),
            ),
          ],
        ),
      ),
    );
  }
}
