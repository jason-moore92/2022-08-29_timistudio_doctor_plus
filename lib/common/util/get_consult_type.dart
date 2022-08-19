import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/app/animation_click.dart';
import 'package:flutter_doctor_plus/common/constant/colors.dart';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/constant/styles.dart';
import 'package:flutter_doctor_plus/common/model/event_model.dart';
import 'package:flutter_doctor_plus/common/route/routes.dart';
import 'package:flutter_doctor_plus/common/widget/bottom_custom.dart';
import 'package:flutter_doctor_plus/common/widget/button/elevated_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/button/outlined_cpn.dart';
import 'package:flutter_doctor_plus/common/widget/dialog_custom.dart';
import 'package:flutter_doctor_plus/common/widget/image.dart';
import 'package:flutter_doctor_plus/common/constant/enum.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/ongoing_call.dart';
import 'package:flutter_doctor_plus/feature/consults/widget/send_reason.dart';
import 'package:flutter_doctor_plus/feature/live_chat/screen/service_live_chat.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'string.dart';

ImageAsset getImage(type) {
  switch (type) {
    case ConsultType.appointment:
      return const ImageAsset(icTypeAppointment);
    case ConsultType.message:
      return const ImageAsset(icTypeMessage);
    case ConsultType.voice:
      return const ImageAsset(icTypeCall);
    case ConsultType.liveChat:
      return const ImageAsset(icTypeLiveChat);
    case ConsultType.video:
      return const ImageAsset(icTypeVideo);
    case 'bank':
      return const ImageAsset(icPayment, color: grayBlue);
    case 'account':
    default:
      return const ImageAsset(icAccount, color: grayBlue);
  }
}

Color getColor(type) {
  switch (type) {
    case 'account':
    case 'bank':
      return isabelline;
    default:
      return Colors.transparent;
  }
}

EdgeInsets getPadding(type) {
  switch (type) {
    case 'account':
    case 'bank':
      return const EdgeInsets.all(8);
    default:
      return const EdgeInsets.all(0);
  }
}

Container getConsultIcon(dynamic type, {double? size, double? borderRadius}) {
  return Container(
    width: size ?? 40,
    height: size ?? 40,
    padding: getPadding(type),
    decoration: BoxDecoration(
        color: getColor(type),
        borderRadius: BorderRadius.circular(borderRadius ?? 12)),
    child: getImage(type),
  );
}

String getConsultType(dynamic type) {
  switch (type) {
    case ConsultType.appointment:
      return LocaleKeys.appointmentType.tr();
    case ConsultType.message:
      return LocaleKeys.message.tr();
    case ConsultType.voice:
      return LocaleKeys.voice.tr();
    case ConsultType.liveChat:
      return LocaleKeys.liveChat.tr();
    case ConsultType.video:
      return LocaleKeys.video.tr();
    case 'account':
    case 'bank':
    default:
      return 'system';
  }
}

String getConsultStatus(dynamic status) {
  switch (status) {
    case StatusType.accepted:
      return LocaleKeys.accepted.tr();
    case StatusType.iCancelled:
    case StatusType.patientCancelled:
      return LocaleKeys.cancelled.tr();
    case StatusType.completed:
      return LocaleKeys.completed.tr().toCapitalized();
    case StatusType.unconfirmed:
      return LocaleKeys.unconfirmed.tr();
    case StatusType.inProgress:
    default:
      return LocaleKeys.inProgress.tr();
  }
}

Color getStatusColor(dynamic status) {
  switch (status) {
    case StatusType.accepted:
      return tiffanyBlue;
    case StatusType.iCancelled:
    case StatusType.patientCancelled:
      return neonFuchsia;
    case StatusType.completed:
      return goGreen;
    case StatusType.unconfirmed:
      return orange;
    case StatusType.inProgress:
    default:
      return dodgerBlue;
  }
}

Widget getConsultBottomText(ConsultType type, StatusType status) {
  if (type == ConsultType.appointment && status == StatusType.accepted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: AnimationClick(
        function: () {},
        child: Text(
          'Cancel Appointment',
          style: h7(fontWeight: '600', color: grayBlue, hasUnderLine: true),
        ),
      ),
    );
  }

  if (status == StatusType.inProgress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: AnimationClick(
        function: () {},
        child: RichText(
          text: TextSpan(
            text: 'Are you done? ',
            style: h7(color: grayBlue),
            children: <TextSpan>[
              TextSpan(
                text: 'Finish consult now.',
                style: h7(color: grayBlue, hasUnderLine: true),
              )
            ],
          ),
        ),
      ),
    );
  }
  return const SizedBox();
}

Widget buttonDecline(BuildContext context, EventModel item) {
  return DialogCustom(
    childInside: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ImageAsset(imgWarning, width: 72, height: 72),
        const SizedBox(height: 32),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Are you sure want to decline " +
                getConsultType(item.type).toLowerCase() +
                " request from ",
            style: h4(context: context),
            children: <TextSpan>[
              TextSpan(
                text: item.patient.name,
                style: h4(context: context, fontWeight: '700'),
              ),
              TextSpan(
                text: "?",
                style: h4(context: context),
              )
            ],
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: BottomCustom(
                childInside: const SendReason(),
                childShowBottom: OutlinedCpn(
                  textButton: 'Yes',
                  textStyle: h5(color: grayBlue, fontWeight: '700'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedCpn(
                function: () {},
                gradient: linear,
                textButton: 'No',
                textStyle: h5(color: grey100, fontWeight: '700'),
              ),
            ),
          ],
        )
      ],
    ),
    childShowDialog: OutlinedCpn(
      function: () {},
      textButton: 'Decline',
      textStyle: h5(color: grayBlue, fontWeight: '700'),
    ),
  );
}

Widget getConsultBottomType(BuildContext context, EventModel item) {
  if (item.status == StatusType.unconfirmed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buttonDecline(context, item)),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedCpn(
            function: () {},
            gradient: linear,
            textButton: 'Accept',
            textStyle: h5(color: grey100, fontWeight: '700'),
          ),
        ),
      ],
    );
  }

  if (item.status == StatusType.inProgress &&
      item.type == ConsultType.liveChat) {
    return ElevatedCpn(
      function: () {
        Navigator.of(context).pushNamed(Routes.serviceLiveChat,
            arguments: const ServiceLiveChat());
      },
      gradient: linear,
      textButton: 'Continue chat with Patient',
      textStyle: h5(color: grey100, fontWeight: '700'),
    );
  }

  if (item.status == StatusType.inProgress) {
    return ElevatedCpn(
      function: () {},
      gradient: linear,
      textButton: 'Continue ',
      textStyle: h5(color: grey100, fontWeight: '700'),
    );
  }

  if (item.type == ConsultType.appointment &&
      item.status == StatusType.accepted) {
    return DialogCustom(
      childInside: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Are you sure you want to change plan ?",
            textAlign: TextAlign.center,
            style: h2(context: context, fontWeight: '700'),
          ),
          const SizedBox(height: 16),
          Text(
            "Please make a phone call for patient to negotiate if you want to change the visit time.",
            textAlign: TextAlign.center,
            style: h4(context: context),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedCpn(
                  function: () {
                    Navigator.of(context).pushNamed(Routes.ongoingCall,
                        arguments: OngoingCall(patient: item.patient));
                  },
                  textButton: LocaleKeys.callNow.tr(),
                  textStyle: h5(color: grayBlue, fontWeight: '700'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedCpn(
                  function: () {},
                  gradient: linear,
                  textButton: LocaleKeys.cancel.tr(),
                  textStyle: h5(color: grey100, fontWeight: '700'),
                ),
              ),
            ],
          )
        ],
      ),
      childShowDialog: OutlinedCpn(
        function: () {},
        textButton: 'Change Plan',
        textStyle: h5(color: grayBlue, fontWeight: '700'),
      ),
    );
  }

  if (item.type == ConsultType.message && item.status == StatusType.accepted) {
    return Row(
      children: [
        Expanded(child: buttonDecline(context, item)),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedCpn(
            function: () {},
            gradient: linear,
            textButton: 'Answer',
            textStyle: h5(color: grey100, fontWeight: '700'),
          ),
        ),
      ],
    );
  }

  if ((item.type == ConsultType.voice || item.type == ConsultType.video) &&
      item.status == StatusType.accepted) {
    return Row(
      children: [
        Expanded(child: buttonDecline(context, item)),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedCpn(
            function: () {
              Navigator.of(context).pushNamed(Routes.ongoingCall,
                  arguments: OngoingCall(patient: item.patient));
            },
            gradient: linear,
            textButton: LocaleKeys.callNow.tr(),
            textStyle: h5(color: grey100, fontWeight: '700'),
          ),
        ),
      ],
    );
  }

  return const SizedBox();
}
