import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SendReason extends StatefulWidget {
  const SendReason({Key? key}) : super(key: key);

  @override
  State<SendReason> createState() => _SendReasonState();
}

class _SendReasonState extends State<SendReason> {
  TextEditingController optionalNote = TextEditingController();
  FocusNode optionalFocus = FocusNode();
  bool choiceOne = false;
  bool choiceTwo = false;

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
              'Tell us the reason',
              style: h3(context: context, fontWeight: '700'),
            ),
            AppWidget.divider2(),
            Row(
              children: [
                Expanded(
                  child: Text("The question is'n my speciality",
                      style: h4(context: context)),
                ),
                Checkbox(
                    value: choiceOne,
                    activeColor: dodgerBlue,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: dodgerBlue),
                        borderRadius: BorderRadius.circular(24)),
                    onChanged: (value) {
                      setState(() {
                        choiceOne = true;
                        choiceTwo = false;
                      });
                    })
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("The patient behaves inappropriately",
                      style: h4(context: context)),
                ),
                Checkbox(
                    value: choiceTwo,
                    activeColor: dodgerBlue,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: dodgerBlue),
                        borderRadius: BorderRadius.circular(24)),
                    onChanged: (value) {
                      setState(() {
                        choiceOne = false;
                        choiceTwo = true;
                      });
                    })
              ],
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
            ElevatedCpn(
              function: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              gradient: linear,
              textButton: 'Send',
              textStyle: h5(color: grey100, fontWeight: '700'),
            ),
          ],
        ),
      ),
    );
  }
}
