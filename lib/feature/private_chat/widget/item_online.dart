import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/chat_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/private_chat/screen/chat_detail.dart';

class ItemOnline extends StatelessWidget {
  const ItemOnline({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return AnimationClick(
      function: () {
        Navigator.of(context).pushNamed(Routes.chatDetail,
            arguments: ChatDetail(chatModel: chatModel));
      },
      child: SizedBox(
        width: width / 75 * 13,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ImageAsset(chatModel.avt[0], width: 64, height: 64),
                  ),
                  chatModel.online
                      ? Positioned(
                          right: -5,
                          top: 0,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: grey100,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: malachite,
                                  borderRadius: BorderRadius.circular(24)),
                            ),
                          ))
                      : const SizedBox()
                ],
              ),
            ),
            Text(
              chatModel.name,
              textAlign: TextAlign.center,
              style: h8(context: context),
            )
          ],
        ),
      ),
    );
  }
}
