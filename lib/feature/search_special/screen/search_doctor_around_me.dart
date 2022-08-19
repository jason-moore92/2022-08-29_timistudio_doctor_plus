import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/custom_map.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/share_doctor_widget.dart';

import '../../../common/route/routes.dart';

class SearchDoctorAroundMe extends StatelessWidget {
  const SearchDoctorAroundMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Stack(
        children: [
          const CustomMap(),
          Positioned(
            top: 52,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonCpn(
                    path: icBack,
                    function: () {
                      Navigator.of(context).pop();
                    },
                    iconColor: Theme.of(context).color11,
                    hasOutline: false,
                    bgColor: Theme.of(context).color12,
                  ),
                  IconButtonCpn(
                      path: icFilter,
                      bgColor: orange,
                      function: () {
                        Navigator.of(context).pushNamed(Routes.doctorFilter);
                      },
                      hasOutline: false,
                      iconColor: grey100)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24, bottom: 24),
                  child: IconButtonCpn(
                    path: icCurrentLocation,
                    iconColor: dodgerBlue,
                    hasOutline: false,
                    bgColor: Theme.of(context).color12,
                  ),
                ),
                SizedBox(
                  height: 138,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: width - 48,
                            child: ShareDoctorWidget(
                              doctorModel: doctorsDemo[index],
                              hasClick: true,
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemCount: doctorsDemo.length),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
