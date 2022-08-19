import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/chat_model.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/menu_option.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/chat_message.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ServiceLiveChat extends StatefulWidget {
  const ServiceLiveChat(
      {Key? key,
      this.isLiveChat = true,
      this.chatModel,
      this.withAppBar = true})
      : super(key: key);
  final bool isLiveChat;
  final ChatModel? chatModel;
  final bool withAppBar;
  @override
  State<ServiceLiveChat> createState() => _ServiceLiveChatState();
}

class _ServiceLiveChatState extends State<ServiceLiveChat> {
  TextEditingController chatCtl = TextEditingController();
  FocusNode chatFn = FocusNode();

  bool visible = false;
  Widget iconButton(String path, {Function()? function}) {
    return IconButtonCpn(
      function: function,
      path: path,
      hasOutline: false,
      paddingAll: 4,
      iconColor: grey100,
      bgColor: dodgerBlue,
    );
  }

  Widget iconButton2(String path,
      {Color bgColor = tiffanyBlue, String? text, Function()? function}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: IconButtonCpn(
            function: function,
            path: path,
            hasOutline: false,
            paddingAll: 8,
            iconColor: grey100,
            bgColor: bgColor,
          ),
        ),
        Text(
          text ?? LocaleKeys.doctorProfile.tr(),
          style: h8(context: context),
        )
      ],
    );
  }

  void sendMessage() {
    if (chatCtl.text.isNotEmpty) {
      setState(() {
        messageList.insert(
            0, {'message': chatCtl.text, 'sender': 'me', 'type': 'message'});
      });
      chatCtl.text = '';
    }
  }

  @override
  void initState() {
    messageList = List.from(messageList.reversed);
    super.initState();
  }

  @override
  void dispose() {
    chatCtl.dispose();
    chatFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.withAppBar
          ? AppBarCpn(
              center: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.chatModel == null
                        ? patientDemo.name
                        : widget.chatModel!.name,
                    style: h3(fontWeight: '700', context: context),
                  ),
                  widget.isLiveChat
                      ? Text(
                          '19:19 ${LocaleKeys.remaining.tr()} (30 ${LocaleKeys.minsVisit.tr()})',
                          style: h8(fontWeight: '700', color: grayBlue),
                        )
                      : const SizedBox(),
                ],
              ),
              right: widget.isLiveChat
                  ? const MenuOption(
                      childInside: IconButtonCpn(
                          path: icOption,
                          borderColor: dodgerBlue,
                          iconColor: dodgerBlue),
                    )
                  : const IconButtonCpn(
                      path: icOption,
                      borderColor: dodgerBlue,
                      iconColor: dodgerBlue),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                widget.isLiveChat
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: grey100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.liveChatConsult.tr(),
                                  style:
                                      h5(fontWeight: '700', context: context),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Today, Jan 05, 2020',
                                    style: h7(context: context),
                                  ),
                                ),
                                Text(
                                  '09:30 AM - 10:00 AM',
                                  style: h7(context: context),
                                )
                              ],
                            ),
                            const IconButtonCpn(
                              path: icAddtional,
                              iconColor: grey100,
                              paddingAll: 4,
                              bgColor: dodgerBlue,
                              hasOutline: false,
                              widthIcon: 16,
                              heightIcon: 16,
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: ListView.separated(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemBuilder: (context, index) {
                        if (index > 0) {
                          return ChatMessage(
                            message: messageList[index],
                            sameSender: messageList[index]['sender'] ==
                                messageList[index - 1]['sender'],
                          );
                        } else {
                          return ChatMessage(message: messageList[index]);
                        }
                      },
                      separatorBuilder: (context, index) {
                        if (index == messageList.length - 1) {
                          return const SizedBox(height: 40);
                        } else {
                          return SizedBox(
                              height: messageList[index]['sender'] ==
                                      messageList[index + 1]['sender']
                                  ? 4
                                  : 40);
                        }
                      },
                      itemCount: messageList.length),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            color: grey100,
            child: Row(
              children: [
                iconButton(share, function: () {
                  setState(() {
                    visible = !visible;
                  });
                }),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: iconButton(icAttach)),
                Expanded(
                    child: TextField(
                        controller: chatCtl,
                        focusNode: chatFn,
                        decoration: InputDecoration(
                          fillColor: isabelline.withOpacity(0.68),
                          filled: true,
                          contentPadding: const EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: isabelline)),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: iconButton(icSend, function: () {
                    sendMessage();
                  }),
                ),
              ],
            ),
          ),
          Visibility(
              visible: visible,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                color: backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconButton2(icDoctor, function: () {
                      setState(() {
                        messageList.insert(0, {
                          'message': 'Does she has others symptoms?',
                          'sender': 'me',
                          'type': 'shareDoctor'
                        });
                      });
                    }),
                    iconButton2(icHospital,
                        text: LocaleKeys.hospitalClinic.tr(),
                        bgColor: neonFuchsia),
                    iconButton2(icHealthGuide, function: () {
                      setState(() {
                        messageList.insert(0, {
                          'message':
                              'You can check this health guide after consult finished',
                          'sender': 'me',
                          'type': 'healthGuide'
                        });
                      });
                    },
                        text: LocaleKeys.healthGuide.tr(),
                        bgColor: bdazzledBlue),
                    iconButton2(icMedication, function: () async {
                      final result = await Navigator.of(context)
                              .pushNamed(Routes.shareMedication)
                          as List<MedicationModel>;
                      setState(() {
                        for (var item in result) {
                          messageList.insert(0, {
                            'message': item.nameMedication,
                            'sender': 'me',
                            'type': 'medication'
                          });
                        }
                      });
                    }, text: LocaleKeys.medication.tr(), bgColor: orange),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
