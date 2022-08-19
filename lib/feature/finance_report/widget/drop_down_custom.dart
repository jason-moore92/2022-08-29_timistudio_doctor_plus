import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';

class DropdownCustom extends StatelessWidget {
  const DropdownCustom({Key? key, required this.title, required this.items})
      : super(key: key);
  final String title;
  final List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(title, style: h7(context: context)),
        ),
        DropdownButton<String>(
          value: items![0].value,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 24,
          elevation: 10,
          style: h7(color: dodgerBlue, fontWeight: '700'),
          underline: const SizedBox(height: 0),
          onChanged: (newValue) {},
          items: items,
        ),
      ],
    );
  }
}
