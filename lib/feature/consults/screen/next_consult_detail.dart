import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/event_model.dart';
import 'package:flutter_doctor_plus/common/util/get_consult_type.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/patient_card.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/additional_information.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/consult_details.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/consult_time.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/patient_review.dart';

class NextConsultDetail extends StatelessWidget {
  const NextConsultDetail({Key? key, required this.item}) : super(key: key);

  final EventModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCpn(
            color: grey100,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(getConsultType(item.type),
                    style: h3(context: context, fontWeight: '700')),
                Text(getConsultStatus(item.status),
                    style: h6(
                        color: getStatusColor(item.status), fontWeight: '600'))
              ],
            )),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 12,
              bottom: MediaQuery.of(context).padding.bottom),
          decoration: const BoxDecoration(
            color: grey100,
          ),
          child: getConsultBottomType(context, item),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              PatientCard(patient: item.patient),
              const SizedBox(height: 16),
              ConsultTime(time: item.time),
              const SizedBox(height: 16),
              ConsultDetails(
                  consultDetails: item.consultDetail, status: item.status),
              const SizedBox(height: 16),
              const AdditionalInformation(),
              const SizedBox(height: 16),
              item.review != null
                  ? PatientReview(review: item.review!)
                  : const SizedBox(),
              getConsultBottomText(item.type, item.status)
            ],
          ),
        ));
  }
}
