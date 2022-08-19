import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddImageBottom extends StatefulWidget {
  const AddImageBottom(
      {Key? key, required this.addAttachFile, this.image = imgChickenpox})
      : super(key: key);

  final Function addAttachFile;
  final String image;

  @override
  State<AddImageBottom> createState() => _AddImageBottomState();
}

class _AddImageBottomState extends State<AddImageBottom> {
  TextEditingController optionalNote = TextEditingController();
  FocusNode optionalFocus = FocusNode();

  @override
  void dispose() {
    optionalNote.dispose();
    optionalFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 40,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LocaleKeys.helpPatient.tr(),
              style: h4(context: context),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ImageAsset(
                widget.image,
                height: 160,
              ),
            ),
            const SizedBox(height: 24),
            TextFieldCpn(
              maxLength: 150,
              hintText: LocaleKeys.optionalNote.tr(),
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
                      widget.addAttachFile(AttachmentModel(
                        image: widget.image,
                        description: optionalNote.text,
                        time: DateTime.now(),
                      ));
                    },
                    gradient: linear,
                    textButton: LocaleKeys.addNow.tr(),
                    textStyle: h5(color: grey100, fontWeight: '700'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
