import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/model/menu_option_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/menu_option_custom.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/add_image_bottom.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'add_medication_bottom.dart';

class WriteAnAnswerBottom extends StatelessWidget {
  const WriteAnAnswerBottom(
      {Key? key,
      required this.getListDoctor,
      required this.addMedication,
      required this.addAttachFile})
      : super(key: key);

  final Function getListDoctor;
  final Function addMedication;
  final Function addAttachFile;

  Widget rowItem(
      BuildContext context, String icon, String title, Function onTap) {
    return AnimationClick(
      function: onTap,
      child: Row(
        children: [
          Container(
            child: ImageAsset(icon),
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: dodgerBlue,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              title,
              style: h8(context: context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomCustomController controller = BottomCustomController();
    return Container(
      decoration: const BoxDecoration(
        color: grey100,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 12,
        left: 24,
        right: 24,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomCustom(
            childShowBottom: rowItem(
                context, icMedication, LocaleKeys.allMedications.tr(), () {}),
            childInside: AddMedicationBottom(
              medication: medicationsDemo[0],
              addMedication: addMedication,
            ),
          ),
          MenuOptionCustom(
            childShowOption:
                rowItem(context, icAttach, LocaleKeys.addFiles.tr(), () {}),
            childInside: [
              MenuOptionModel(
                  title: LocaleKeys.takePhoto.tr(),
                  function: () {
                    controller.show(context, backgroundColor,
                        AddImageBottom(addAttachFile: addAttachFile));
                  }),
              MenuOptionModel(title: LocaleKeys.takeVideo.tr()),
              MenuOptionModel(title: LocaleKeys.fromDoctorLibrary.tr()),
              MenuOptionModel(title: LocaleKeys.fromPhotos.tr()),
            ],
          ),
          MenuOptionCustom(
            childShowOption:
                rowItem(context, share, LocaleKeys.shareInfo.tr(), () {}),
            childInside: [
              MenuOptionModel(
                title: LocaleKeys.shareDoctor.tr(),
                function: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(Routes.shareDoctor) as List<DoctorModel>;
                  getListDoctor(result);
                },
              ),
              MenuOptionModel(title: LocaleKeys.shareHealth.tr()),
              MenuOptionModel(title: LocaleKeys.shareHospitals.tr()),
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
