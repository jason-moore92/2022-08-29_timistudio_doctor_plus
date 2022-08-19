import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddMedicationBottom extends StatefulWidget {
  const AddMedicationBottom(
      {Key? key, required this.medication, this.addMedication})
      : super(key: key);

  final MedicationModel medication;
  final Function? addMedication;

  @override
  State<AddMedicationBottom> createState() => _AddMedicationBottomState();
}

class _AddMedicationBottomState extends State<AddMedicationBottom> {
  TextEditingController medicationName = TextEditingController();
  FocusNode medicationFocus = FocusNode();
  TextEditingController optionalNote = TextEditingController();
  FocusNode optionalFocus = FocusNode();

  @override
  void dispose() {
    medicationName.dispose();
    medicationFocus.dispose();
    optionalNote.dispose();
    optionalFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    medicationName.text = widget.medication.nameMedication;
    super.initState();
  }

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
              LocaleKeys.addMedication.tr(),
              style: h3(context: context, fontWeight: '700'),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldCpn(
                  labelText: LocaleKeys.medicationName.tr(),
                  controller: medicationName,
                  focusNode: medicationFocus,
                  enabled: false,
                ),
                const SizedBox(height: 24),
                TextFieldCpn(
                  maxLength: 150,
                  hintText: LocaleKeys.addMedicationHint.tr(),
                  labelText: LocaleKeys.optionalNote.tr(),
                  controller: optionalNote,
                  focusNode: optionalFocus,
                  maxLines: 4,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedCpn(
                        function: () {
                          Navigator.of(context).pop();
                        },
                        textButton: LocaleKeys.cancel.tr(),
                        textStyle: h5(color: grayBlue, fontWeight: '700'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedCpn(
                        function: () {
                          Navigator.of(context).pop();
                          widget.addMedication!(widget.medication);
                        },
                        gradient: linear,
                        textButton: LocaleKeys.addNow.tr(),
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
