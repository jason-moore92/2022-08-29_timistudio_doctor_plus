import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/attach_file_item.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/card_close.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/doctor_card.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/medication_item.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/write_an_answer_bottom.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class WriteAnAnswer extends StatefulWidget {
  const WriteAnAnswer({Key? key}) : super(key: key);

  @override
  State<WriteAnAnswer> createState() => _WriteAnAnswerState();
}

class _WriteAnAnswerState extends State<WriteAnAnswer> {
  TextEditingController textField = TextEditingController();
  FocusNode textFocus = FocusNode();

  List<DoctorModel> selectedDoctors = [];
  List<MedicationModel> selectedMedications = [];
  List<AttachmentModel> addedAttachments = [];

  @override
  void dispose() {
    textField.dispose();
    textFocus.dispose();
    super.dispose();
  }

  void getListDoctor(List<DoctorModel> doctors) {
    setState(() {
      selectedDoctors = doctors;
    });
  }

  void addMedication(MedicationModel medication) {
    setState(() {
      if (selectedMedications.indexWhere((element) => element == medication) ==
          -1) {
        selectedMedications.add(medication);
      }
    });
  }

  void addAttachFile(AttachmentModel attachment) {
    setState(() {
      addedAttachments.add(attachment);
    });
  }

  Widget sectionTitle(String icon, String title) {
    return Column(
      children: [
        const SizedBox(height: 48),
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: tiffanyBlue.withOpacity(0.16),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ImageAsset(icon, color: tiffanyBlue),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: h5(context: context, fontWeight: '700'),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: close,
        right: AnimationClick(
          disabled: textField.text.isEmpty,
          child: Text(
            LocaleKeys.sendPatient.tr(),
            softWrap: true,
            style: h5(
              color: textField.text.isEmpty ? platinum : dodgerBlue,
              fontWeight: '700',
            ),
          ),
        ),
      ),
      bottomNavigationBar: WriteAnAnswerBottom(
        getListDoctor: getListDoctor,
        addMedication: addMedication,
        addAttachFile: addAttachFile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.writeAnswer.tr(),
                style: h1(context: context, fontWeight: '700'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ImageAsset(icQuote, color: platinum),
              ),
              TextField(
                controller: textField,
                focusNode: textFocus,
                style: h3(context: context, fontWeight: '600'),
                maxLines: 8,
                minLines: 2,
                maxLength: 2000,
                decoration: InputDecoration.collapsed(
                  hintStyle: h4(color: grayBlue),
                  hintText: LocaleKeys.tellPatient.tr(),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              // Add Medication
              selectedMedications.isNotEmpty
                  ? sectionTitle(icMedication, LocaleKeys.prescription.tr())
                  : const SizedBox(),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedMedications.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                itemBuilder: (context, index) {
                  return CardClose(
                    onClose: () {
                      setState(() {
                        selectedMedications.remove(selectedMedications[index]);
                      });
                    },
                    child: MedicationItem(
                      medication: selectedMedications[index],
                    ),
                  );
                },
              ),

              // Add Attachment
              addedAttachments.isNotEmpty
                  ? sectionTitle(icAttach, LocaleKeys.attachedFiles.tr())
                  : const SizedBox(),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: addedAttachments.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                itemBuilder: (context, index) {
                  return CardClose(
                    onClose: () {
                      setState(() {
                        addedAttachments.remove(addedAttachments[index]);
                      });
                    },
                    child: AttachFileItem(
                      attachFile: addedAttachments[index],
                    ),
                  );
                },
              ),

              // Add Doctor
              selectedDoctors.isNotEmpty
                  ? sectionTitle(icDoctor, LocaleKeys.shareInfo.tr())
                  : const SizedBox(),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedDoctors.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                itemBuilder: (context, index) {
                  return CardClose(
                    onClose: () {
                      setState(() {
                        selectedDoctors.remove(selectedDoctors[index]);
                      });
                    },
                    child: DoctorCard(
                      doctor: selectedDoctors[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
