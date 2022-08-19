import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key, this.image = imgChickenpox}) : super(key: key);
  final String image;

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  TextEditingController optionalNote = TextEditingController();
  FocusNode optionalFocus = FocusNode();

  @override
  void dispose() {
    optionalNote.dispose();
    optionalFocus.dispose();
    super.dispose();
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
              LocaleKeys.noteSomething.tr(),
              style: h4(context: context),
            ),
            Container(
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ImageAsset(
                widget.image,
                height: 160,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: TextFieldCpn(
                maxLength: 100,
                hintText: LocaleKeys.optionalNote.tr(),
                labelText: LocaleKeys.optionalNote.tr(),
                controller: optionalNote,
                focusNode: optionalFocus,
                maxLines: 4,
              ),
            ),
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
                    },
                    gradient: linear,
                    textButton: LocaleKeys.add.tr(),
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
