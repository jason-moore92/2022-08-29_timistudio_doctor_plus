import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/chat_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/feature/private_chat/screen/chat_detail.dart';

class ItemChat extends StatelessWidget {
  const ItemChat({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  Widget listAvt() {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ImageAsset(chatModel.avt[0], width: 40, height: 40),
        ),
        Positioned(
            bottom: -4,
            left: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: grey100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ImageAsset(chatModel.avt[1], width: 40, height: 40),
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool checkTime =
        chatModel.currentMessTime!.isAfter(chatModel.currentTimeIncome!);
    return AnimationClick(
      function: () {
        Navigator.of(context).pushNamed(Routes.chatDetail,
            arguments: ChatDetail(chatModel: chatModel));
      },
      child: Row(
        children: [
          checkTime
              ? Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: neonFuchsia,
                      borderRadius: BorderRadius.circular(24)),
                )
              : Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              chatModel.avt.length > 1
                  ? SizedBox(width: 56, height: 56, child: listAvt())
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child:
                          ImageAsset(chatModel.avt[0], width: 56, height: 56),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      chatModel.name,
                      style: h5(
                          context: context,
                          fontWeight: checkTime ? '700' : '600'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          chatModel.currentMessage!,
                          overflow: TextOverflow.ellipsis,
                          style: h7(
                              color: checkTime ? black : grayBlue,
                              fontWeight: checkTime ? ' 700' : '400'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${chatModel.currentMessTime!.hour}:${chatModel.currentMessTime!.minute}',
                          style: h7(color: grayBlue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
