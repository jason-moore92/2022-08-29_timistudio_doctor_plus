library country_code_picker;

import 'package:collection/collection.dart' show IterableExtension;
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
// import 'package:country_code_picker/country_code.dart';
// import 'package:country_code_picker/country_codes.dart';
import 'package:flutter/material.dart';

import 'selection_custom.dart';

class CountryCodeCustom extends StatefulWidget {
  const CountryCodeCustom({
    this.onChanged,
    this.onInit,
    this.initialSelection,
    this.favorite = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(8.0),
    this.showCountryOnly = false,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.dialogTextStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.showFlagDialog,
    this.hideMainText = false,
    this.showFlagMain,
    this.flagDecoration,
    this.builder,
    this.flagWidth = 32.0,
    this.enabled = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.barrierColor,
    this.backgroundColor,
    this.boxDecoration,
    this.comparator,
    this.countryFilter,
    this.hideSearch = false,
    this.showDropDownButton = false,
    this.dialogSize,
    this.dialogBackgroundColor,
    this.closeIcon = const Icon(Icons.close),
    this.countryList = codes,
    Key? key,
  }) : super(key: key);
  final ValueChanged<CountryCode>? onChanged;
  final ValueChanged<CountryCode?>? onInit;
  final String? initialSelection;
  final List<String> favorite;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? dialogTextStyle;
  final WidgetBuilder? emptySearchBuilder;
  final Function(CountryCode?)? builder;
  final bool enabled;
  final TextOverflow textOverflow;
  final Icon closeIcon;

  /// Barrier color of ModalBottomSheet
  final Color? barrierColor;

  /// Background color of ModalBottomSheet
  final Color? backgroundColor;

  /// BoxDecoration for dialog
  final BoxDecoration? boxDecoration;

  /// the size of the selection dialog
  final Size? dialogSize;

  /// Background color of selection dialog
  final Color? dialogBackgroundColor;

  /// used to customize the country list
  final List<String>? countryFilter;

  /// shows the name of the country instead of the dialcode
  final bool showOnlyCountryWhenClosed;

  /// aligns the flag and the Text left
  ///
  /// additionally this option also fills the available space of the widget.
  /// this is especially useful in combination with [showOnlyCountryWhenClosed],
  /// because longer country names are displayed in one line
  final bool alignLeft;

  /// shows the flag
  final bool showFlag;

  final bool hideMainText;

  final bool? showFlagMain;

  final bool? showFlagDialog;

  /// Width of the flag images
  final double flagWidth;

  /// Use this property to change the order of the options
  final Comparator<CountryCode>? comparator;

  /// Set to true if you want to hide the search part
  final bool hideSearch;

  /// Set to true if you want to show drop down button
  final bool showDropDownButton;

  /// [BoxDecoration] for the flag image
  final Decoration? flagDecoration;

  /// An optional argument for injecting a list of countries
  /// with customized codes.
  final List<Map<String, String>> countryList;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final List<Map<String, String>> jsonList = countryList;

    List<CountryCode> elements = jsonList.map((json) => CountryCode.fromMap(json)).toList();

    if (comparator != null) {
      elements.sort(comparator);
    }

    if (countryFilter != null && countryFilter!.isNotEmpty) {
      final uppercaseCustomList = countryFilter!.map((c) => c.toUpperCase()).toList();
      elements = elements
          .where((c) =>
              uppercaseCustomList.contains(c.code) || uppercaseCustomList.contains(c.name) || uppercaseCustomList.contains(c.dialCode))
          .toList();
    }

    return CountryCodeCustomState(elements);
  }
}

class CountryCodeCustomState extends State<CountryCodeCustom> {
  CountryCodeCustomState(this.elements);
  CountryCode? selectedItem;
  List<CountryCode> elements = [];
  List<CountryCode> favoriteElements = [];

  @override
  Widget build(BuildContext context) {
    Widget _widget;
    if (widget.builder != null) {
      _widget = InkWell(
        onTap: showCountryCodeCustomDialog,
        child: widget.builder!(selectedItem),
      );
    } else {
      _widget = TextButton(
        onPressed: widget.enabled ? showCountryCodeCustomDialog : null,
        child: Padding(
          padding: widget.padding,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.showFlagMain != null ? widget.showFlagMain! : widget.showFlag)
                Flexible(
                  flex: widget.alignLeft ? 0 : 1,
                  fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
                  child: Container(
                      clipBehavior: widget.flagDecoration == null ? Clip.none : Clip.hardEdge,
                      decoration: widget.flagDecoration,
                      margin: widget.alignLeft ? const EdgeInsets.only(right: 16.0, left: 8.0) : const EdgeInsets.only(right: 16.0),
                      child: selectedItem!.flagImage
                      // Image.asset(
                      //   selectedItem!.flagUri!,
                      //   package: 'country_code_picker',
                      //   width: widget.flagWidth,
                      // ),
                      ),
                ),
              if (!widget.hideMainText)
                Flexible(
                  fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
                  child: Text(
                    widget.showOnlyCountryWhenClosed
                        // ? selectedItem!.toCountryStringOnly()
                        ? selectedItem!.name
                        : selectedItem.toString(),
                    style: widget.textStyle ?? Theme.of(context).textTheme.button,
                    overflow: widget.textOverflow,
                  ),
                ),
              if (widget.showDropDownButton)
                Flexible(
                  flex: widget.alignLeft ? 0 : 1,
                  fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
                  child: Padding(
                      padding: widget.alignLeft ? const EdgeInsets.only(right: 16.0, left: 8.0) : const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: widget.flagWidth,
                      )),
                ),
            ],
          ),
        ),
      );
    }
    return _widget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // elements = elements.map((e) => e.localize(context)).toList();
    elements = elements.map((e) => e).toList();
    _onInit(selectedItem);
  }

  @override
  void didUpdateWidget(CountryCodeCustom oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialSelection != widget.initialSelection) {
      if (widget.initialSelection != null) {
        selectedItem = elements.firstWhere(
            (e) =>
                (e.code!.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
                (e.dialCode == widget.initialSelection) ||
                (e.name!.toUpperCase() == widget.initialSelection!.toUpperCase()),
            orElse: () => elements[0]);
      } else {
        selectedItem = elements[0];
      }
      _onInit(selectedItem);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code!.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection) ||
              (e.name!.toUpperCase() == widget.initialSelection!.toUpperCase()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((e) =>
            widget.favorite.firstWhereOrNull(
                (f) => e.code!.toUpperCase() == f.toUpperCase() || e.dialCode == f || e.name!.toUpperCase() == f.toUpperCase()) !=
            null)
        .toList();
  }

  void showCountryCodeCustomDialog() {
    showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: SelectionCustom(
              elements,
              favoriteElements,
              showCountryOnly: widget.showCountryOnly,
              emptySearchBuilder: widget.emptySearchBuilder,
              searchDecoration: widget.searchDecoration,
              searchStyle: widget.searchStyle,
              textStyle: widget.dialogTextStyle,
              boxDecoration: widget.boxDecoration,
              showFlag: widget.showFlagDialog ?? widget.showFlag,
              flagWidth: widget.flagWidth,
              size: widget.dialogSize,
              backgroundColor: widget.dialogBackgroundColor,
              barrierColor: widget.barrierColor,
              hideSearch: widget.hideSearch,
              closeIcon: widget.closeIcon,
              flagDecoration: widget.flagDecoration,
            ),
          );
        }).then((dynamic e) {
      if (e != null) {
        setState(() {
          selectedItem = e;
        });

        _publishSelection(e);
      }
    });
  }

  void _publishSelection(CountryCode e) {
    if (widget.onChanged != null) {
      widget.onChanged!(e);
    }
  }

  void _onInit(CountryCode? e) {
    if (widget.onInit != null) {
      widget.onInit!(e);
    }
  }
}
