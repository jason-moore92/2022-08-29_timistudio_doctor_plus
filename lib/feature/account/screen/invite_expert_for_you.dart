import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/widget/app_bar.dart';
import 'package:flutter_doctor_plus/common/constant/export.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class InviteExpertForYou extends StatefulWidget {
  const InviteExpertForYou({Key? key}) : super(key: key);

  @override
  State<InviteExpertForYou> createState() => _InviteExpertForYouState();
}

class _InviteExpertForYouState extends State<InviteExpertForYou> {
  bool isCopy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            LocaleKeys.inviteExperts.tr(),
            style: h1(context: context, fontWeight: '700'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 24),
            child: Text(
              'Share refferal link to other experts and get \$100 when the expert join and verify successfully.',
              style: h6(context: context),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: grey100,
                boxShadow: [
                  BoxShadow(
                      color: color4.withOpacity(0.04),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'doctorplus.com/referral/u249202',
                  style: h5(context: context),
                ),
                AnimationClick(
                  function: () {
                    setState(() {
                      isCopy = true;
                    });
                  },
                  child: Text(
                    isCopy ? ' Copied' : 'Copy',
                    style: h5(color: isCopy ? goGreen : dodgerBlue),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              LocaleKeys.shareVia.tr(),
              style: h6(context: context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AnimationClick(
                    child: ImageAsset(icFacebook, width: 40, height: 40)),
                AnimationClick(
                    child: ImageAsset(inInstagram, width: 40, height: 40)),
                AnimationClick(
                    child: ImageAsset(icTwitter, width: 40, height: 40)),
                AnimationClick(
                    child: ImageAsset(icEmail, width: 40, height: 40)),
              ],
            ),
          ),
          Text(
            LocaleKeys.shareTheOfferWithExperts.tr(),
            style: h6(context: context),
          )
        ],
      ),
    );
  }
}
