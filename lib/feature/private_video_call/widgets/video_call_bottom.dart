import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/model/chat_model.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

import 'attach_bottom.dart';
import 'chat_bottom.dart';
import 'icon_column.dart';

class VideoCallBottom extends StatefulWidget {
  const VideoCallBottom({Key? key}) : super(key: key);

  @override
  State<VideoCallBottom> createState() => _VideoCallBottomState();
}

class _VideoCallBottomState extends State<VideoCallBottom> {
  bool isMuted = false;
  bool isCameraOff = false;

  List<AttachmentModel> attachments = [];
  List<ChatModel> chats = [];

  void addAttachFile(AttachmentModel attachment) {
    setState(() {
      attachments.add(attachment);
    });
  }

  void addChat(ChatModel chat) {
    setState(() {
      chats.add(chat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).padding.bottom, horizontal: 24),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).padding.bottom + 128,
        decoration: BoxDecoration(
          color: black.withOpacity(0.68),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomCustom(
              childShowBottom: IconColumn(
                title: LocaleKeys.textChat.tr(),
                icon: icLiveChat,
                notifications: 10,
              ),
              childInside: const ChatBottom(),
            ),
            IconColumn(
              title: 'Off',
              icon: icMute,
              bgOpacity: isCameraOff ? 0.7 : 0.2,
            ),
            IconColumn(
              function: () {
                setState(() {
                  isMuted = !isMuted;
                });
              },
              title: LocaleKeys.mute.tr(),
              icon: isMuted ? icInterview : icMute,
              bgOpacity: isMuted ? 0.7 : 0.2,
            ),
            BottomCustom(
              childShowBottom: IconColumn(
                title: LocaleKeys.sharedFile.tr(),
                icon: icAttach,
                notifications: 3,
              ),
              childInside: AttachBottom(attachments: attachments),
            ),
          ],
        ));
  }
}
