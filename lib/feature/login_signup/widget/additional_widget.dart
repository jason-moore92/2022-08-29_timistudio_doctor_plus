import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/additional_model.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AdditionalWidget extends StatefulWidget {
  const AdditionalWidget({Key? key, this.additionalModel}) : super(key: key);
  final AdditionalModel? additionalModel;
  @override
  State<AdditionalWidget> createState() => _AdditionalWidgetState();
}

class _AdditionalWidgetState extends State<AdditionalWidget> {
  TextEditingController additionalCtl = TextEditingController();
  FocusNode additionalFn = FocusNode();
  @override
  void dispose() {
    additionalCtl.dispose();
    additionalFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 18),
      child: TextFieldCpn(
        controller: additionalCtl,
        focusNode: additionalFn,
        labelText: LocaleKeys.certificationName.tr(),
      ),
    );
  }
}
