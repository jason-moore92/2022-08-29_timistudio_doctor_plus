import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/feature/login_signup/bloc/upload_image/bloc_upload_image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatelessWidget {
  const AddImage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    XFile? picked;
    Uint8List? fileBytes;
    String? fileName;
    final height = AppWidget.getHeightScreen(context);
    return SizedBox(
      height: height / 3,
      child: BlocBuilder<UploadImageBloc, UploadImageState>(
          builder: (context, state) {
        if (state is UploadImageSuccess) {
          fileBytes = state.uint8list;
        }
        return fileBytes == null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: height / 3,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: isabelline),
                  ),
                  Positioned(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: IconButtonCpn(
                          function: () async {
                            picked = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            if (picked != null) {
                              File imageFile = File(picked!.path);
                              fileBytes = await imageFile.readAsBytes();
                              fileName = picked!.name;
                              BlocProvider.of<UploadImageBloc>(context).add(
                                  UploadImage(
                                      uint8list: fileBytes!,
                                      fileName: fileName!));
                            }
                          },
                          path: icPlus,
                          hasOutline: false,
                          bgColor: dodgerBlue,
                          iconColor: grey100,
                        ),
                      ),
                      Text(
                        title ?? LocaleKeys.addTipImage.tr(),
                        style: h7(context: context),
                      )
                    ],
                  ))
                ],
              )
            : Image.memory(
                fileBytes!,
                width: double.infinity,
                fit: BoxFit.fill,
              );
      }),
    );
  }
}
