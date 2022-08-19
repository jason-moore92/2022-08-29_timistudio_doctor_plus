import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/event_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/util/get_consult_type.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/next_consult_detail.dart';

class ConsultItem extends StatelessWidget {
  const ConsultItem({Key? key, required this.item}) : super(key: key);

  final EventModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      padding: const EdgeInsets.all(24),
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(clipBehavior: Clip.none, children: [
              ImageAsset(item.patient.avatar, width: 56, height: 56),
              Positioned(
                bottom: -8,
                right: -8,
                child: getConsultIcon(item.type, size: 24, borderRadius: 8),
              ),
            ]),
          ),
          Expanded(
            child: AnimationClick(
              function: () {
                Navigator.of(context).pushNamed(Routes.nextConsultDetails,
                    arguments: NextConsultDetail(item: item));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: getConsultType(item.type),
                      style: h6(color: grayBlue, fontWeight: '600'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' - ',
                          style: h6(color: grayBlue),
                        ),
                        TextSpan(
                          text: getConsultStatus(item.status),
                          style: h6(
                              color: getStatusColor(item.status),
                              fontWeight: '600'),
                        ),
                      ],
                    ),
                  ),
                  Text(item.patient.name,
                      style: h4(context: context, fontWeight: '700')),
                  Text('19:19 mins left', style: h6(context: context))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
