import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/widget/item_tip.dart';
import '../bloc/health_guide_created_me/bloc_list_created_me.dart';
import '../bloc/health_guide_saved/bloc_list_saved.dart';
import '../widget/health_guide_app_bar.dart';

class HealthGuide extends StatefulWidget {
  const HealthGuide({Key? key}) : super(key: key);

  @override
  State<HealthGuide> createState() => _HealthGuideState();
}

class _HealthGuideState extends State<HealthGuide>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<TipModel> healthSaved = [];
  List<TipModel> healthCreatedMe = [];
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    BlocProvider.of<ListSavedBloc>(context).add(InitialSavedEvent());
    BlocProvider.of<ListCreatedMeBloc>(context).add(InitialCreatedMesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, value) => [
                HealthGuideAppBar(
                  controller: _controller,
                  created: healthGuidesCreatedByMe.length,
                  saved: healthGuidesCreatedByMe.length,
                )
              ],
          body: TabBarView(
            controller: _controller,
            children: [
              BlocBuilder<ListCreatedMeBloc, ListCreatedMeState>(
                builder: (context, state) {
                  if (state is ListCreatedMeSuccess) {
                    healthCreatedMe = state.createdMe;
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: healthCreatedMe.length,
                    itemBuilder: (context, index) {
                      return ItemTip(
                        type: Type.createdMe,
                        tipModel: healthCreatedMe[index],
                      );
                    },
                  );
                },
              ),
              BlocBuilder<ListSavedBloc, ListSavedState>(
                builder: (context, state) {
                  if (state is ListSavedSuccess) {
                    healthSaved = state.tips;
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: healthSaved.length,
                    itemBuilder: (context, index) {
                      return ItemTip(
                        type: Type.savedGuide,
                        tipModel: healthSaved[index],
                      );
                    },
                  );
                },
              )
            ],
          )),
    );
  }
}
