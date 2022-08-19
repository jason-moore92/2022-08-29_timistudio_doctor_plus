import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/textfield.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    Key? key,
    required this.searchCtl,
    required this.searchFn,
    required this.label,
    this.labels = const ['English', 'Spanish', 'French'],
    this.labelStyle,
    this.colorSuffixIcon,
    this.colorPrefixIcon,
  }) : super(key: key);
  final TextEditingController searchCtl;
  final FocusNode searchFn;
  final String label;
  final List<String> labels;
  final TextStyle? labelStyle;
  final Color? colorSuffixIcon;
  final Color? colorPrefixIcon;
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextFieldCpn(
            controller: widget.searchCtl,
            focusNode: widget.searchFn,
            showPrefixIcon: true,
            prefixIcon: icSearch,
            labelText: widget.label,
            labelStyle: widget.labelStyle,
            colorSuffixIcon: widget.colorSuffixIcon,
            colorPrefixIcon: widget.colorPrefixIcon,
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
              widget.labels.length,
              (index) => AnimationClick(
                    function: () {},
                    child: Chip(
                      label: Text(
                        widget.labels[index],
                        style: h8(color: grey100, fontWeight: '700'),
                      ),
                      deleteIcon: const Icon(
                        Icons.close,
                        color: grey100,
                        size: 16,
                      ),
                      onDeleted: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor: dodgerBlue,
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                    ),
                  )),
        ),
      ],
    );
  }
}
