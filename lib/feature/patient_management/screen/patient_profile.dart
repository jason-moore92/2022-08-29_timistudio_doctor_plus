import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/consult_day_item.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import '../widget/patient_profile_appbar.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key, required this.patientModel})
      : super(key: key);
  final PatientModel patientModel;

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<DateTime> times = [
    DateTime.now(),
    DateTime.now().subtract(const Duration(days: 30)),
    DateTime.now().subtract(const Duration(days: 60))
  ];

  List<Map<String, String>> sharedMedical = [
    {
      'icon': icAdditionalInformation,
      'title': LocaleKeys.basicInformation.tr(),
      'amount': ''
    },
    {
      'icon': icHealthMetric,
      'title': LocaleKeys.healthMetrics.tr(),
      'amount': ''
    },
    {
      'icon': icCondition,
      'title': LocaleKeys.conditionsSymptoms.tr(),
      'amount': '2'
    },
    {
      'icon': icClinicVital,
      'title': LocaleKeys.clinicalVitals.tr(),
      'amount': '0'
    }
  ];

  Widget listView({bool hasTimeRow = true, bool showTime = true}) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: times.length,
            itemBuilder: (context, index) {
              return ConsultDayItem(
                time: times[index],
                hasTimeRow: hasTimeRow,
                showTime: showTime,
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 40,
          );
        },
        itemCount: 4);
  }

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          PatientProfileAppBar(
            patientModel: widget.patientModel,
            controller: _controller,
          )
        ],
        body: TabBarView(controller: _controller, children: [
          listView(
            hasTimeRow: false,
          ),
          listView(
            hasTimeRow: false,
            showTime: false,
          ),
          Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  color: Color.fromRGBO(0, 64, 128, 0.04),
                )
              ],
              color: grey100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView.separated(
                padding: const EdgeInsets.all(24),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AnimationClick(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButtonCpn(
                              path: sharedMedical[index]['icon']!,
                              hasOutline: false,
                              paddingAll: 8,
                              iconColor: grey100,
                              bgColor: tiffanyBlue,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(sharedMedical[index]['title']!,
                                  style: h5(context: context)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(sharedMedical[index]['amount']!,
                                  style: h5(context: context)),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24,
                              color: grayBlue,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 40,
                  );
                },
                itemCount: sharedMedical.length),
          ),
        ]),
      ),
    );
  }
}
