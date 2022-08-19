import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/feature/onboarding/bloc/slider/bloc_slider.dart';
import 'package:flutter_doctor_plus/feature/onboarding/widget/slider_page.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = AppWidget.getHeightScreen(context);
    final SliderBloc counterBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(gradient: linear),
        child: Column(
          children: [
            BlocBuilder<SliderBloc, int>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Color.fromRGBO(0, 64, 128, 0.16))
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(state == 0 ? 32 : 0),
                          bottomRight: Radius.circular(state == 3 ? 32 : 0))),
                  height: height / 58 * 39,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(state == 0 ? 32 : 0),
                        bottomRight: Radius.circular(state == 3 ? 32 : 0)),
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pages.length,
                      onPageChanged: (value) {
                        if (value > state) {
                          counterBloc.add(SwipeRight());
                        } else {
                          counterBloc.add(SwipeLeft());
                        }
                      },
                      itemBuilder: (context, index) {
                        return pages[index];
                      },
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                List<Widget>.generate(pages.length, (index) {
                              return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: index == state ? 8 : 4,
                                  width: index == state ? 8 : 4,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: grey100));
                            }));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: OutlinedCpn(
                                  function: () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.login);
                                  },
                                  textButton: LocaleKeys.logIn.tr(),
                                  textStyle: h5(
                                      color: Theme.of(context).color12,
                                      fontWeight: '700')),
                            ),
                          ),
                          Expanded(
                            child: ElevatedCpn(
                              function: () {
                                Navigator.of(context).pushNamed(Routes.signUp);
                              },
                              textButton: LocaleKeys.signUp.tr(),
                              bgColor: grey100,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(18, 178, 179, 1))
                              ],
                              textStyle: h5(color: goGreen, fontWeight: '700'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.arePatient.tr(),
                          style: h7(color: grey100, fontWeight: '600'),
                        ),
                        AnimationClick(
                          child: Text(
                            LocaleKeys.getHere.tr(),
                            style: h7(
                                color: grey100,
                                fontWeight: '600',
                                hasUnderLine: true),
                          ),
                        )
                      ],
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
