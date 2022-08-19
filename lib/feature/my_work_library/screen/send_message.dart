import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  late bool openSendMess = true;
  late bool isEdit = false;
  TextEditingController descriptionNote = TextEditingController();
  FocusNode descriptionFocus = FocusNode();
  TextEditingController priceNote = TextEditingController();
  FocusNode priceFocus = FocusNode();

  Widget component(String title, String number, String unit,
      {bool hasEdit = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: hasEdit
                    ? (isEdit
                        ? Row(
                            children: [
                              Expanded(
                                child: TextFieldCpn(
                                  hintText: title,
                                  labelText: title,
                                  controller: priceNote,
                                  focusNode: priceFocus,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  child: ElevatedCpn(
                                    gradient: linear,
                                    textButton: 'Save',
                                    textStyle: h5(
                                        color: Theme.of(context).color12,
                                        fontWeight: '700'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: AnimationClick(
                                  function: () {
                                    setState(() {
                                      isEdit = !isEdit;
                                    });
                                  },
                                  child: Text(
                                    LocaleKeys.cancel.tr(),
                                    style: h7(color: grayBlue),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Text(
                            title,
                            style: h7(context: context),
                          ))
                    : Text(
                        title,
                        style: h7(context: context),
                      ),
              ),
              hasEdit
                  ? (isEdit
                      ? const SizedBox()
                      : AnimationClick(
                          function: () {
                            setState(() {
                              isEdit = !isEdit;
                            });
                          },
                          child: const ImageAsset(icBase),
                        ))
                  : const SizedBox()
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: number,
            style: h5(context: context, fontFamily: 'Oswald'),
            children: <TextSpan>[
              TextSpan(
                text: unit,
                style: h7(context: context),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    descriptionNote.dispose();
    descriptionFocus.dispose();
    priceNote.dispose();
    priceFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isEdit = !isEdit;
        });
      },
      child: Scaffold(
        appBar: const AppBarCpn(
          iconLeft: icBack,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.sendMessage.tr(),
                  style: h1(context: context, fontWeight: '700'),
                ),
                CupertinoSwitch(
                    value: openSendMess,
                    onChanged: (value) {
                      setState(() {
                        openSendMess = value;
                      });
                    })
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: color4.withOpacity(0.04),
                    offset: const Offset(0, 5),
                    blurRadius: 10)
              ], color: grey100, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  component(LocaleKeys.servicePrice.tr(), '\$45', ' / 30 mins'),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 48),
                    child: component(LocaleKeys.consulted.tr(), '234', ' times',
                        hasEdit: false),
                  ),
                  TextFieldCpn(
                    maxLength: 200,
                    hintText: LocaleKeys.sendMultipleMessages.tr(),
                    labelText: LocaleKeys.description.tr(),
                    controller: descriptionNote,
                    focusNode: descriptionFocus,
                    maxLines: 4,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
