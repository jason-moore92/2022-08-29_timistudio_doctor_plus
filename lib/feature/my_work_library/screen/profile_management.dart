import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/sliding_segmented.dart';
import '../widget/item_review.dart';
import 'package:flutter_doctor_plus/feature/search_special/widget/expert_profile_appbar.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import '../../search_special/widget/about_doctor.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({Key? key, required this.doctorModel})
      : super(key: key);
  final DoctorModel doctorModel;

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement>
    with TickerProviderStateMixin {
  late TabController controller;
  late TabController controlle2;
  late AnimationController controller3;
  late AnimationController controller4;
  late AnimationController controller5;
  final double progress = 0.96;
  final double progress2 = 0.92;

  Widget stat(
      String title, Color color, AnimationController controller, String text,
      {bool hasPercent = true}) {
    return Column(
      children: [
        Stack(alignment: Alignment.center, children: [
          SizedBox(
            width: 84,
            height: 84,
            child: CircularProgressIndicator(
                strokeWidth: 4,
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
                backgroundColor: color.withOpacity(0.1),
                color: color),
          ),
          Text(hasPercent ? '$text %' : text,
              style: h2(color: color, fontFamily: 'Oswald'))
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            title,
            style: h8(context: context),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controlle2 = TabController(length: 2, vsync: this);
    controller3 = AnimationController(
      vsync: this,
      upperBound: progress,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller3.forward();
    controller4 = AnimationController(
      vsync: this,
      upperBound: progress2,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller4.forward();
    controller5 = AnimationController(
      vsync: this,
      upperBound: widget.doctorModel.rate / 5,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller5.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          ExpertProfileAppBar(
            doctorModel: widget.doctorModel,
            controller: controller,
            isExpertProfile: false,
          )
        ],
        body: TabBarView(controller: controller, children: [
          AboutDoctor(doctorModel: widget.doctorModel, hasEdit: true),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(24),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SlidingSegmented(
                  controlle: controlle2,
                  tabs: [
                    LocaleKeys.fromPatients.tr(),
                    LocaleKeys.fromColleagues.tr()
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: stat(LocaleKeys.recommend.tr(), tiffanyBlue,
                          controller3, '96')),
                  Expanded(
                      child: stat(LocaleKeys.startOnTime.tr(), dodgerBlue,
                          controller4, '92')),
                  Expanded(
                      child: stat(LocaleKeys.rating.tr(), orange, controller5,
                          widget.doctorModel.rate.toString(),
                          hasPercent: false)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 8),
                child: Text(
                  LocaleKeys.reviewsUper.tr(),
                  style: h3(context: context, fontWeight: '700'),
                ),
              ),
              Row(
                children: [
                  const ImageAsset(icRateFull, width: 16, height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      widget.doctorModel.rate.toString(),
                      style: h7(context: context, fontWeight: '600'),
                    ),
                  ),
                  Text(
                    '(${widget.doctorModel.reviews} reviews)',
                    style: h7(color: grayBlue),
                  ),
                ],
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 32);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ItemReview(
                    reviewModel: reviews[index],
                  );
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
