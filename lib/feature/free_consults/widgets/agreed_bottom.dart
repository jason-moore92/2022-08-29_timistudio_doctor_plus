import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/util/string.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/doctor_card.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AgreedBottom extends StatelessWidget {
  const AgreedBottom({Key? key, required this.doctors}) : super(key: key);

  final List<DoctorModel> doctors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 16,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 2 / 3,
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
              child: RichText(
                text: TextSpan(
                  text: LocaleKeys.doctorAgreed.tr().toCapitalized() + "  ",
                  style: h3(context: context, fontWeight: '700'),
                  children: <TextSpan>[
                    TextSpan(
                      text: doctors.length.toString(),
                      style: h5(color: grayBlue),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: isabelline),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: DoctorCard(doctor: doctors[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
