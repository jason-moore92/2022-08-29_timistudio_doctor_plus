import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/text_field/search.dart';
import 'package:flutter_doctor_plus/feature/live_chat/widget/share_doctor_widget.dart';
import 'package:flutter_doctor_plus/feature/search_special/bloc/list_doctor/bloc_list_doctor.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({Key? key}) : super(key: key);

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  late ListDoctorBloc listDoctorBloc;
  List<DoctorModel> doctors = [];

  Widget listView(String title, List<DoctorModel> doctors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: h3(context: context, fontWeight: '700'),
        ),
        ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 24),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ShareDoctorWidget(
                doctorModel: doctors[index],
                hasClick: true,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: doctors.length),
      ],
    );
  }

  @override
  void initState() {
    BlocProvider.of<ListDoctorBloc>(context).add(InitialDoctorEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    listDoctorBloc = BlocProvider.of<ListDoctorBloc>(context);
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
        center: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchCpn(
              controller: searchCtl,
              onChanged: (value) {
                listDoctorBloc.add(SearchDoctorEvent(searchValue: value));
              },
              focusNode: searchFn,
              hintText: LocaleKeys.enterSearchDoctor.tr(),
            ),
          ),
        ),
        right: IconButtonCpn(
            function: () {
              Navigator.of(context).pushNamed(Routes.searchDoctorAroundMe);
            },
            iconColor: dodgerBlue,
            borderColor: dodgerBlue,
            path: icNearby),
      ),
      floatingActionButton: IconButtonCpn(
          path: icFilter,
          function: () {
            Navigator.of(context).pushNamed(Routes.doctorFilter);
          },
          bgColor: orange,
          paddingAll: 16,
          hasOutline: false,
          iconColor: grey100),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: BlocBuilder<ListDoctorBloc, ListDoctorState>(
                    builder: (context, state) {
                  if (state is ListDoctorSuccess) {
                    doctors = state.doctors;
                  }
                  return listView(LocaleKeys.myNetwork.tr(), doctors);
                }),
              ),
              listView(LocaleKeys.maybeYouKnow.tr(), doctorsMaybeKnowDemo)
            ],
          ),
        ),
      ),
    );
  }
}
