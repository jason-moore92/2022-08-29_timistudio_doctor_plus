import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/event_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/patient_card.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/next_consult_detail.dart';
import 'package:flutter_doctor_plus/feature/private_video_call/screens/video_call.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'button/elevated_cpn.dart';
import 'button/outlined_cpn.dart';

class RequestBottom extends StatelessWidget {
  const RequestBottom({Key? key, required this.event}) : super(key: key);

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: isabelline),
              ),
            ),
            child: Text(
              LocaleKeys.videoRequest.tr(),
              style: h3(context: context, fontWeight: '700'),
            ),
          ),
          const SizedBox(height: 24),
          PatientCard(patient: event.patient, color: isabelline),
          const SizedBox(height: 48),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      border: const Border.fromBorderSide(
                        BorderSide(color: tiffanyBlue, width: 12),
                      ),
                    ),
                    width: 96,
                    height: 96,
                    child: Text(
                      '56',
                      style: h0(color: tiffanyBlue),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: grey100,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: malachite.withOpacity(0.5),
                              blurRadius: 8,
                            )
                          ]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: malachite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          AnimationClick(
            function: () {
              Navigator.of(context).pop();
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: LocaleKeys.notReady.tr() + ". ",
                style: h4(color: grayBlue),
                children: <TextSpan>[
                  TextSpan(
                    text: LocaleKeys.cancelRequest.tr(),
                    style: h4(color: grayBlue, hasUnderLine: true),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedCpn(
                        function: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                              Routes.nextConsultDetails,
                              arguments: NextConsultDetail(item: event));
                        },
                        textButton: LocaleKeys.viewDetail.tr(),
                        textStyle: h5(color: grayBlue, fontWeight: '700'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedCpn(
                        function: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                            Routes.videoCall,
                            arguments: VideoCall(patient: event.patient),
                          );
                        },
                        gradient: linear,
                        textButton: LocaleKeys.callNow.tr(),
                        textStyle: h5(color: grey100, fontWeight: '700'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
