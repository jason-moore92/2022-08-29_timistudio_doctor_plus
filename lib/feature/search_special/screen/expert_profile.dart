import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import '../widget/about_doctor.dart';
import '../widget/expert_profile_appbar.dart';

class ExpertProfile extends StatefulWidget {
  const ExpertProfile({Key? key, required this.doctorModel}) : super(key: key);
  final DoctorModel doctorModel;

  @override
  State<ExpertProfile> createState() => _ExpertProfileState();
}

class _ExpertProfileState extends State<ExpertProfile>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
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
            controller: _controller,
          )
        ],
        body: TabBarView(controller: _controller, children: [
          AboutDoctor(doctorModel: widget.doctorModel),
          Container(),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}
