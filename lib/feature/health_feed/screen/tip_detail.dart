import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/util/number_format.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import '../widget/tip_detail_app_bar.dart';

class TipDetail extends StatelessWidget {
  const TipDetail({Key? key, required this.tipModel}) : super(key: key);
  final TipModel tipModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ElevatedCpn(
            gradient: linear,
            textButton: LocaleKeys.thanks.tr(),
            leftWidget: const ImageAsset(
              icThanks,
              color: grey100,
            ),
            textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              TipDetailAppBar(
                tipModel: tipModel,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      '${numberFormat.format(tipModel.thanks)} Thanks',
                      style: h7(color: grayBlue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: Text(
                      LocaleKeys.createdBy.tr(),
                      style: h7(context: context),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ImageAsset(
                            tipModel.avtDoctor,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tipModel.nameDoctor,
                              style: h5(color: dodgerBlue, fontWeight: '700')),
                          Text('Integrative Medicine',
                              style: h7(context: context)),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 24),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "shared a tip on ",
                        style: h7(context: context),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Air Pollotion",
                            style: h7(color: dodgerBlue, fontWeight: '600'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(tipModel.description!, style: h4(context: context)),
                  tipModel.interestingFact != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                              'Interesting Fact: ${tipModel.interestingFact}',
                              style: h4(context: context)),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ));
  }
}
