import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield_phone.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class HospitalWidget extends StatefulWidget {
  const HospitalWidget({Key? key, this.hospitalModel}) : super(key: key);
  final HospitalModel? hospitalModel;
  @override
  State<HospitalWidget> createState() => _HospitalWidgetState();
}

class _HospitalWidgetState extends State<HospitalWidget> {
  TextEditingController nameHospitalCtl = TextEditingController();
  FocusNode nameHospitalFn = FocusNode();
  TextEditingController addressCtl = TextEditingController();
  FocusNode addressFn = FocusNode();
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();
  TextEditingController insuranceCtl = TextEditingController();
  FocusNode insuranceFn = FocusNode();

  @override
  void dispose() {
    nameHospitalCtl.dispose();
    nameHospitalFn.dispose();
    addressCtl.dispose();
    addressFn.dispose();
    phoneCtl.dispose();
    phoneFn.dispose();
    insuranceCtl.dispose();
    insuranceFn.dispose();
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
            controller: nameHospitalCtl,
            focusNode: nameHospitalFn,
            labelText: LocaleKeys.hospitalClinicName.tr(),
          ),
        ),
        TextFieldCpn(
          controller: addressCtl,
          focusNode: addressFn,
          showPrefixIcon: true,
          prefixIcon: icPinMap,
          readOnly: true,
          functionPrefix: () async {
            final dynamic location =
                await Navigator.of(context).pushNamed(Routes.selectAddress) ??
                    LocaleKeys.address.tr();
            addressCtl.text = location;
          },
          labelText: LocaleKeys.address.tr(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: TextFieldPhone(
            controller: phoneCtl,
            focusNode: phoneFn,
            labelText: LocaleKeys.officePhoneNumber.tr(),
          ),
        ),
        TextFieldCpn(
          controller: insuranceCtl,
          focusNode: insuranceFn,
          hasMutilLine: true,
          labelText: LocaleKeys.insurancePlans.tr(),
        ),
      ],
    );
  }
}
