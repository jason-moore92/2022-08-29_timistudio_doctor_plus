import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/widget/attach_file_item.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class AttachBottom extends StatelessWidget {
  const AttachBottom({Key? key, required this.attachments}) : super(key: key);

  final List<AttachmentModel> attachments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
        top: 16,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 2 / 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: isabelline),
                ),
              ),
              child: Text(
                LocaleKeys.sharedFile.tr(),
                style: h3(context: context, fontWeight: '700'),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: attachments.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: AttachFileItem(
                      attachFile: attachments[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
