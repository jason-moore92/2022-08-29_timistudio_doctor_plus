import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/award_model.dart';
import 'package:flutter_doctor_plus/common/model/certification_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/drop_down.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/list_award/bloc_list_award.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/list_certification/bloc_list_certification.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'attach_photo.dart';

enum Type { certifications, awards }

class WorkProfileCpn extends StatefulWidget {
  const WorkProfileCpn({Key? key, this.type = Type.certifications})
      : super(key: key);
  final Type type;

  @override
  State<WorkProfileCpn> createState() => _WorkProfileCpnState();
}

class _WorkProfileCpnState extends State<WorkProfileCpn> {
  TextEditingController yearCtl = TextEditingController();
  FocusNode yearFn = FocusNode();
  TextEditingController certificationNameCtl = TextEditingController();
  FocusNode certificationNameFn = FocusNode();
  TextEditingController awardNameCtl = TextEditingController();
  FocusNode awardNameFn = FocusNode();
  List<CertificationModel> certifications = [];
  List<AwardModel> awards = [];

  Widget listItems(List<dynamic> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, _) {
        return const SizedBox(
          height: 24,
        );
      },
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: widget.type == Type.certifications
                          ? TextFieldCpn(
                              controller: certificationNameCtl,
                              focusNode: certificationNameFn,
                              labelText: LocaleKeys.certificationName.tr(),
                            )
                          : TextFieldCpn(
                              controller: awardNameCtl,
                              focusNode: awardNameFn,
                              labelText: LocaleKeys.awardName.tr(),
                            ),
                    ),
                  ),
                  const Expanded(
                    child: Dropdown(
                      title: 'Year',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Align(
                alignment: Alignment.center,
                child: AttachPhoto(
                    textButton: widget.type == Type.certifications
                        ? LocaleKeys.attachCertificationPhoto.tr()
                        : LocaleKeys.attachAwardPhoto.tr()),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    widget.type == Type.certifications
        ? BlocProvider.of<ListCertificationBloc>(context)
            .add(InitialCertificationEvent())
        : BlocProvider.of<ListAwardBloc>(context).add(InitialAwardEvent());
    super.initState();
  }

  @override
  void dispose() {
    yearCtl.dispose();
    yearFn.dispose();
    certificationNameCtl.dispose();
    certificationNameFn.dispose();
    awardNameCtl.dispose();
    awardNameFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.type == Type.certifications
              ? LocaleKeys.certifications.tr()
              : LocaleKeys.awards.tr(),
          style: h5(context: context, fontWeight: '700'),
        ),
        widget.type == Type.certifications
            ? BlocBuilder<ListCertificationBloc, ListCertificationState>(
                builder: (context, state) {
                  if (state is ListCertificationSuccess) {
                    certifications = state.certification;
                  }
                  return listItems(certifications);
                },
              )
            : BlocBuilder<ListAwardBloc, ListAwardState>(
                builder: (context, state) {
                  if (state is ListAwardSuccess) {
                    awards = state.award;
                  }
                  return listItems(awards);
                },
              ),
        OutlinedCpn(
          function: () {
            widget.type == Type.certifications
                ? BlocProvider.of<ListCertificationBloc>(context)
                    .add(AddCertificationEvent())
                : BlocProvider.of<ListAwardBloc>(context).add(AddAwardEvent());
          },
          leftWidget: const Icon(
            Icons.add,
            size: 24,
            color: dodgerBlue,
          ),
          vertical: 10,
          textStyle: h7(fontWeight: '700', color: grayBlue),
          textButton: widget.type == Type.certifications
              ? LocaleKeys.addMoreCertification.tr()
              : LocaleKeys.addMoreAward.tr(),
        )
      ],
    );
  }
}
