import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/feature/private_chat/widget/item_online.dart';
import '../widget/item_chat.dart';

class PrivateChat extends StatefulWidget {
  const PrivateChat({Key? key}) : super(key: key);

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SearchCpn(
                onChanged: (value) {},
                controller: searchCtl,
                focusNode: searchFn,
                hintText: 'Search...',
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 24);
                },
                shrinkWrap: true,
                itemCount: usersOnline.length,
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemOnline(
                    chatModel: usersOnline[index],
                  );
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 0),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                shrinkWrap: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return ItemChat(
                    chatModel: chats[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
