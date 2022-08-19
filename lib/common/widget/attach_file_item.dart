import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AttachFileItem extends StatelessWidget {
  const AttachFileItem({Key? key, required this.attachFile}) : super(key: key);
  final AttachmentModel attachFile;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageAsset(
          attachFile.image,
          width: 100,
          height: 72,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                attachFile.description,
                style: h6(context: context),
              ),
              Text(
                LocaleKeys.uploaded.tr() +
                    " " +
                    DateFormat('MMM d, yyyy')
                        .format(attachFile.time ?? DateTime.now()),
                style: h6(color: grayBlue),
              ),
            ],
          ),
        )
      ],
    );
  }
}
