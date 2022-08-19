import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/photo_model.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/util/format_time.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ItemPhoto extends StatelessWidget {
  const ItemPhoto({Key? key, required this.photoModel}) : super(key: key);
  final PhotoModel photoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: color4.withOpacity(0.04),
            offset: const Offset(0, 5),
            blurRadius: 10)
      ], borderRadius: BorderRadius.circular(16), color: grey100),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: ImageAsset(
                  photoModel.image,
                  height: 64,
                  width: 78,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                photoModel.namePhoto,
                style: h7(fontWeight: '700', context: context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  LocaleKeys.uploaded.tr() +
                      ': ' +
                      FormatTime.formatTime(
                          format: Format.mdy, dateTime: photoModel.uploaded),
                  style: h7(color: grayBlue),
                ),
              ),
              Text(
                '34KB',
                style: h7(color: grayBlue),
              )
            ],
          )
        ],
      ),
    );
  }
}
