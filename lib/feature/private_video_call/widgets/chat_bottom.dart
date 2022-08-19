import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/feature/live_chat/screen/service_live_chat.dart';

class ChatBottom extends StatelessWidget {
  const ChatBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 16,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 2 / 3,
        child: const ServiceLiveChat(
          isLiveChat: false,
          withAppBar: false,
        ),
      ),
    );
  }
}
