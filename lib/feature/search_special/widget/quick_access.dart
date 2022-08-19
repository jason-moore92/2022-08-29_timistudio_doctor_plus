import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/feature/live_chat/bloc/list_medication/bloc_list_medication.dart';
import '../bloc/list_condition/bloc_list_condition.dart';

enum TypeSearch { condition, medication }

class QuickAccess extends StatefulWidget {
  const QuickAccess({Key? key, this.typeSearch = TypeSearch.condition})
      : super(key: key);
  final TypeSearch typeSearch;
  @override
  _QuickAccessState createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late ListConditionBloc listConditionBloc;
  late ListMedicationBloc listMedicationBloc;
  late String textSelected = '#';

  Widget itemLabel(String textSelect, String label) {
    return textSelect == label
        ? Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: dodgerBlue, borderRadius: BorderRadius.circular(16)),
            child: Text(label, style: h5(color: grey100, fontWeight: '700')),
          )
        : Align(
            alignment: Alignment.center,
            child: Text(label, style: h5(context: context, fontWeight: '700')),
          );
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listConditionBloc = BlocProvider.of<ListConditionBloc>(context);
    listMedicationBloc = BlocProvider.of<ListMedicationBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            bottom: -(kBottomNavigationBarHeight),
            child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(1.0, 1.0, curve: Curves.linear),
                ),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isDismissed) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    },
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 0,
                        sigmaY: 0,
                      ),
                      child: Container(
                        color: black.withOpacity(0.68),
                        width: width,
                        height: height + kBottomNavigationBarHeight,
                      ),
                    )))),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
              ),
              child: Container(
                height: height / 203 * 80,
                margin: EdgeInsets.symmetric(
                    horizontal: (width - 80) / 2, vertical: 16),
                decoration: BoxDecoration(
                    color: grey100, borderRadius: BorderRadius.circular(16)),
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  separatorBuilder: (context, _) {
                    return const SizedBox(
                      height: 24,
                    );
                  },
                  itemCount: labels.length,
                  itemBuilder: (context, index) {
                    return AnimationClick(
                      function: () {
                        if (widget.typeSearch == TypeSearch.condition) {
                          listConditionBloc
                              .add(QuickAccessEvent(label: labels[index]));
                        } else {
                          listMedicationBloc.add(
                              QuickAccessMedicationEvent(label: labels[index]));
                        }

                        if (_controller.isDismissed) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                      },
                      child: widget.typeSearch == TypeSearch.condition
                          ? BlocBuilder<ListConditionBloc, ListConditionState>(
                              builder: (context, state) {
                                if (state is ListConditionSuccess) {
                                  textSelected = state.textSelected;
                                }
                                return itemLabel(textSelected, labels[index]);
                              },
                            )
                          : BlocBuilder<ListMedicationBloc,
                              ListMedicationState>(
                              builder: (context, state) {
                                if (state is ListMedicationSuccess) {
                                  textSelected = state.textSelected;
                                }
                                return itemLabel(textSelected, labels[index]);
                              },
                            ),
                    );
                  },
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform:
                      Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: IconButtonCpn(
                    function: () {
                      if (_controller.isDismissed) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                    },
                    paddingAll: 16,
                    path: _controller.isDismissed ? icAtoz : close,
                    bgColor: orange,
                    hasOutline: false,
                    iconColor: grey100,
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
