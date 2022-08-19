import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/model/menu_option_model.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/menu_option_custom.dart';
import 'package:flutter_doctor_plus/common/widget/shadow_container.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/add_image_bottom.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class WriteAnAnswer extends StatefulWidget {
  const WriteAnAnswer({Key? key}) : super(key: key);

  @override
  State<WriteAnAnswer> createState() => _WriteAnAnswerState();
}

class _WriteAnAnswerState extends State<WriteAnAnswer> {
  TextEditingController answerController = TextEditingController();
  FocusNode answerFocusNode = FocusNode();
  AttachmentModel? addedAttachments;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? isabelline));
  }

  @override
  void dispose() {
    answerController.dispose();
    answerFocusNode.dispose();
    super.dispose();
  }

  void addAttachFile(AttachmentModel attachment) {
    setState(() {
      addedAttachments = attachment;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BottomCustomController controller = BottomCustomController();
    return ShadowContainer(
      child: Column(
        children: [
          TextField(
            controller: answerController,
            focusNode: answerFocusNode,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: LocaleKeys.writeAnswer.tr(),
              hintStyle: h4(color: grayBlue),
              fillColor: backgroundColor,
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 0),
              ),
              focusedBorder: createInputDecoration(context, color: tiffanyBlue),
              enabledBorder: createInputDecoration(context),
            ),
            maxLines: 8,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuOptionCustom(
                childShowOption: IconButtonCpn(
                  widthIcon: 24,
                  heightIcon: 24,
                  path: icPhotoLibrary,
                  iconColor: dodgerBlue,
                  function: () {},
                  paddingAll: 11,
                ),
                childInside: [
                  MenuOptionModel(
                      title: LocaleKeys.takePhoto.tr(),
                      function: () {
                        controller.show(
                          context,
                          backgroundColor,
                          AddImageBottom(addAttachFile: addAttachFile),
                        );
                      }),
                  MenuOptionModel(title: LocaleKeys.takeVideo.tr()),
                  MenuOptionModel(title: LocaleKeys.fromDoctorLibrary.tr()),
                  MenuOptionModel(title: LocaleKeys.fromPhotos.tr()),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedCpn(
                  disabled: answerController.text.isEmpty,
                  textButton: LocaleKeys.sendPatient.tr(),
                  gradient: linear,
                ),
              ),
            ],
          ),
          BottomCustom(
            controller: controller,
            backgroundColor: grey100,
          )
        ],
      ),
    );
  }
}
