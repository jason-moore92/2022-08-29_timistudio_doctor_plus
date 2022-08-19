import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/model/chat_model.dart';
import 'package:flutter_doctor_plus/feature/live_chat/screen/service_live_chat.dart';

class ChatDetail extends StatelessWidget {
  const ChatDetail({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return ServiceLiveChat(
      isLiveChat: false,
      chatModel: chatModel,
    );
  }
}
