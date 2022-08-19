import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/upload_image/bloc_upload_image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'package:image_picker/image_picker.dart';

class AttachPhoto extends StatefulWidget {
  const AttachPhoto({Key? key, required this.textButton}) : super(key: key);
  final String textButton;

  @override
  State<AttachPhoto> createState() => _AttachPhotoState();
}

class _AttachPhotoState extends State<AttachPhoto> {
  @override
  Widget build(BuildContext context) {
    XFile? picked;
    Uint8List? fileBytes;
    String? fileName;
    final width = AppWidget.getWidthScreen(context);
    return BlocBuilder<UploadImageBloc, UploadImageState>(
        builder: (context, state) {
      if (state is UploadImageSuccess) {
        fileBytes = state.uint8list;
      }
      return fileBytes != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: width,
                        height: 160,
                        decoration: BoxDecoration(
                            color: isabelline,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Image.memory(
                        fileBytes!,
                        width: width / 75 * 46,
                        height: 160,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                AnimationClick(
                  function: () {
                    setState(() {
                      fileBytes == null;
                    });
                  },
                  child: Text(
                    LocaleKeys.deletePhoto.tr(),
                    style: h7(color: grayBlue, hasUnderLine: true),
                  ),
                )
              ],
            )
          : ElevatedCpn(
              function: () async {
                picked =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (picked != null) {
                  File imageFile = File(picked!.path);
                  fileBytes = await imageFile.readAsBytes();
                  fileName = picked!.name;
                  BlocProvider.of<UploadImageBloc>(context).add(
                      UploadImage(uint8list: fileBytes!, fileName: fileName!));
                }
              },
              gradient: linear,
              textButton: widget.textButton,
              leftWidget: const ImageAsset(
                icAttach,
                color: grey100,
              ),
              textStyle:
                  h5(color: Theme.of(context).color12, fontWeight: '700'),
            );
    });
  }
}
