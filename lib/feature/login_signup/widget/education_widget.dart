import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/education_model.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({Key? key, this.educationModel}) : super(key: key);
  final EducationModel? educationModel;
  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  TextEditingController schoolCtl = TextEditingController();
  FocusNode schoolFn = FocusNode();
  TextEditingController educatedCtl = TextEditingController();
  FocusNode educatedFn = FocusNode();
  TextEditingController degreeCtl = TextEditingController();
  FocusNode degreeFn = FocusNode();
  TextEditingController yearCtl = TextEditingController();
  FocusNode yearFn = FocusNode();

  @override
  void dispose() {
    schoolCtl.dispose();
    schoolFn.dispose();
    educatedCtl.dispose();
    educatedFn.dispose();
    degreeCtl.dispose();
    degreeFn.dispose();
    yearCtl.dispose();
    yearFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFieldCpn(
              controller: schoolCtl,
              focusNode: schoolFn,
              labelText: LocaleKeys.medicalSchool.tr(),
            )),
        TextFieldCpn(
          controller: educatedCtl,
          focusNode: educatedFn,
          labelText: LocaleKeys.educated.tr(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFieldCpn(
                  controller: degreeCtl,
                  focusNode: degreeFn,
                  labelText: LocaleKeys.degree.tr(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextFieldCpn(
                    controller: yearCtl,
                    focusNode: yearFn,
                    labelText: LocaleKeys.year.tr(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
