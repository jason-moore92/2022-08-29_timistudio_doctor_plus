import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/app/widget_support.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/icon_button_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool darkMode = false;
  Widget item(BuildContext context, String icon, String title,
      {Function? onTap, bool isDarkMode = false}) {
    return AnimationClick(
      function: onTap ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButtonCpn(
                path: icon,
                hasOutline: false,
                paddingAll: 8,
                iconColor: grey100,
                bgColor: tiffanyBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(title, style: h5(context: context)),
              ),
            ],
          ),
          isDarkMode
              ? CupertinoSwitch(
                  value: darkMode,
                  onChanged: (value) async {
                    setState(() {
                      darkMode = value;
                    });
                  })
              : const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 24,
                  color: grayBlue,
                )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ImageAsset(user.avt, width: 64, height: 64),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name,
                            style: h5(fontWeight: '700', context: context)),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 8),
                          child: Text(
                            'lehieuds@gmail.com',
                            style: h7(context: context),
                          ),
                        ),
                        Text(
                          'Prime Account',
                          style: h7(color: grayBlue),
                        )
                      ],
                    ),
                  ),
                ),
                AnimationClick(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const ImageAsset(icBase)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48, bottom: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: grey100,
                boxShadow: [
                  BoxShadow(
                      color: color4.withOpacity(0.04),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                item(context, icPayment, LocaleKeys.bankDeposit.tr(),
                    onTap: () {
                  Navigator.of(context).pushNamed(Routes.bankDeposit);
                }),
                AppWidget.divider2(),
                item(context, icSetting, 'Settings'),
                AppWidget.divider2(),
                item(context, icDarkMode, LocaleKeys.darkMode.tr(),
                    isDarkMode: true)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: grey100,
                boxShadow: [
                  BoxShadow(
                      color: color4.withOpacity(0.04),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                item(context, icHome, LocaleKeys.aboutDoctorPlus.tr()),
                AppWidget.divider2(),
                item(context, icHelpWhite, LocaleKeys.helpSupport.tr()),
                AppWidget.divider2(),
                item(context, icTerm, LocaleKeys.privacyAndPolicy.tr()),
                AppWidget.divider2(),
                Row(
                  children: [
                    const ImageAsset(imgInviteFriend, width: 80, height: 80),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Invite experts and get \$100 referral for you!',
                                style: h6(context: context),
                              ),
                            ),
                            ElevatedCpn(
                              function: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.inviteExpertForYou);
                              },
                              textButton: 'Invite Now!',
                              borderRadius: 4,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
