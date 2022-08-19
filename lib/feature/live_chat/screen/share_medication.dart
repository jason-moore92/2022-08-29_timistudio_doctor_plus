import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/feature/live_chat/bloc/list_medication/bloc_list_medication.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/medication_detail.dart';
import 'package:flutter_doctor_plus/feature/search_special/widget/quick_access.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class ShareMedication extends StatefulWidget {
  const ShareMedication({Key? key, this.hasShare = true}) : super(key: key);
  final bool hasShare;
  @override
  State<ShareMedication> createState() => _ShareMedicationState();
}

class _ShareMedicationState extends State<ShareMedication> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  List<Map<String, dynamic>> selected = [];
  late ListMedicationBloc listMedicationBloc;

  @override
  void initState() {
    BlocProvider.of<ListMedicationBloc>(context).add(InitialMedicationEvent());
    BlocProvider.of<ListMedicationBloc>(context).medicationsSelected.clear();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listMedicationBloc = BlocProvider.of<ListMedicationBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        iconLeft: widget.hasShare ? close : icBack,
        center: widget.hasShare
            ? Text(
                LocaleKeys.shareMedication.tr(),
                style: h3(context: context),
              )
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SearchCpn(
                    onChanged: (value) {
                      listMedicationBloc
                          .add(SearchMedicationEvent(searchValue: value));
                    },
                    controller: searchCtl,
                    focusNode: searchFn,
                    hintText: LocaleKeys.enterMedication.tr(),
                  ),
                ),
              ),
        right: widget.hasShare
            ? AnimationClick(
                function: () {
                  List<MedicationModel> medicationSelected = [];
                  for (var item in listMedicationBloc.medicationsSelected) {
                    medicationSelected.add(item);
                  }
                  listMedicationBloc.medicationsSelected.clear();
                  Navigator.of(context).pop(medicationSelected);
                },
                child: Text(
                  LocaleKeys.share.tr(),
                  style: h5(color: dodgerBlue, fontWeight: '700'),
                ),
              )
            : const SizedBox(),
      ),
      floatingActionButton: const QuickAccess(
        typeSearch: TypeSearch.medication,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        color: backgroundColor2,
        child: Column(
          children: [
            widget.hasShare
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: SearchCpn(
                      onChanged: (value) {
                        listMedicationBloc
                            .add(SearchMedicationEvent(searchValue: value));
                      },
                      controller: searchCtl,
                      focusNode: searchFn,
                      hintText: LocaleKeys.searchShareMedication.tr(),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: grey100),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: tiffanyBlue.withOpacity(0.16)),
                                child: const ImageAsset(
                                  icMedication,
                                  color: tiffanyBlue,
                                ),
                              )),
                          Text(LocaleKeys.allMedications.tr(),
                              style: h5(
                                context: context,
                                fontWeight: '700',
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          BlocBuilder<ListMedicationBloc, ListMedicationState>(
                        builder: (context, state) {
                          if (state is ListMedicationSuccess) {
                            selected = state.medications;
                          }
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return AnimationClick(
                                  function: () {
                                    if (widget.hasShare) {
                                      listMedicationBloc.add(
                                          SelectedMedicationEvent(
                                              medicationSelected:
                                                  selected[index]
                                                      ['medication']));
                                    } else {
                                      Navigator.of(context)
                                          .pushNamed(Routes.medicationDetail,
                                              arguments: MedicationDetail(
                                                medicationModel: selected[index]
                                                    ['medication'],
                                              ));
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selected[index]['medication']
                                              .nameMedication,
                                          style: h4(
                                              color: dodgerBlue,
                                              fontWeight: '600'),
                                        ),
                                        widget.hasShare
                                            ? Checkbox(
                                                value: selected[index]
                                                    ['selected'],
                                                activeColor: tiffanyBlue,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                onChanged: (value) {})
                                            : const SizedBox()
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return AppWidget.divider2();
                              },
                              itemCount: selected.length);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
