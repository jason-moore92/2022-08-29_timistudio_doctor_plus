import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/item_tip.dart';
import '../bloc/health_tips.dart/bloc_list_tips.dart';

class HealthTips extends StatefulWidget {
  const HealthTips({Key? key}) : super(key: key);

  @override
  State<HealthTips> createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  List<TipModel> tips = [];

  @override
  void initState() {
    BlocProvider.of<ListTipsBloc>(context).add(InitialTipsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        right: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButtonCpn(
                  iconColor: dodgerBlue,
                  borderColor: dodgerBlue,
                  path: icSearch),
            ),
            IconButtonCpn(
                function: () {
                  Navigator.of(context).pushNamed(Routes.addNewTip);
                },
                iconColor: dodgerBlue,
                borderColor: dodgerBlue,
                path: icPlus)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<ListTipsBloc, ListTipsState>(
                builder: (context, state) {
                  if (state is ListTipsSuccess) {
                    tips = state.tips;
                  }
                  return Text(
                    'Health Tips [${tips.length}]',
                    style: h1(context: context, fontWeight: '700'),
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<ListTipsBloc, ListTipsState>(
                builder: (context, state) {
                  if (state is ListTipsSuccess) {
                    tips = state.tips;
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 40),
                    itemCount: tips.length,
                    itemBuilder: (context, index) {
                      return ItemTip(
                        tipModel: tips[index],
                        type: Type.healthTip,
                        hasClick: false,
                      );
                    },
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
