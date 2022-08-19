import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/private_video_call/screens/video_call_end.dart';
import 'package:flutter_doctor_plus/feature/private_video_call/widgets/video_call_bottom.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({Key? key, required this.patient}) : super(key: key);

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCpn(
          color: grey100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImageAsset(icSound),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        patient.name,
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '29:12 remaining (30 mins visit)',
                        style: h7(color: grayBlue),
                      ),
                    ],
                  )
                ],
              ),
              IconButtonCpn(
                function: () {
                  Navigator.of(context).pushReplacementNamed(Routes.videoEnded,
                      arguments: VideoCallEnded(patient: patient));
                },
                path: icCallOff,
                bgColor: neonFuchsia,
                iconColor: grey100,
                borderRadius: 16,
                paddingAll: 8,
                widthIcon: 32,
                heightIcon: 32,
                hasOutline: false,
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Center(
                child: ImageAsset(
              patient.avatar,
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width - 96,
            )),
            Positioned(
              top: 24,
              left: 24,
              width: 80,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                    color: black.withOpacity(0.68),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const Positioned(
              bottom: 0,
              child: VideoCallBottom(),
            ),
          ],
        ));
  }
}
