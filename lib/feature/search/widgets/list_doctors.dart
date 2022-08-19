import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/share_doctor_widget.dart';

class ListDoctor extends StatelessWidget {
  const ListDoctor({Key? key, required this.doctors}) : super(key: key);
  final List<DoctorModel> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ShareDoctorWidget(
            doctorModel: doctors[index],
            hasClick: true,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: doctors.length);
  }
}
