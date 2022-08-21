import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'feature/account/bloc/dark_mode/bloc_dark_mode.dart';
import 'feature/account/bloc/list_bank/bloc_list_bank.dart';
import 'feature/my_work_health_guide/bloc/health_guide_created_me/list_created_me_bloc.dart';
import 'feature/my_work_health_guide/bloc/health_guide_saved/list_saved_bloc.dart';
import 'feature/my_work_health_guide/bloc/health_tips.dart/bloc_list_tips.dart';
import 'feature/my_work_library/bloc/working_day/working_day_bloc.dart';
import 'feature/my_work_library/bloc/working_time/working_time_bloc.dart';
import 'feature/my_work_topics/bloc/list_condition_topic/bloc_list_condition_topic.dart';
import 'feature/search_special/bloc/list_condition/bloc_list_condition.dart';
import 'feature/search_special/bloc/list_doctor/list_doctor_bloc.dart';
import 'feature/live_chat/bloc/list_medication/bloc_list_medication.dart';
import 'feature/login_signup/bloc/list_additional/bloc_list_additional.dart';
import 'feature/login_signup/bloc/list_award/list_award_bloc.dart';
import 'feature/login_signup/bloc/list_certification/list_certification_bloc.dart';
import 'feature/login_signup/bloc/list_education/bloc_list_education.dart';
import 'feature/login_signup/bloc/choose_location/choose_location_bloc.dart';
import 'feature/login_signup/bloc/upload_image/bloc_upload_image.dart';
import 'package:flutter_doctor_plus/translations/codegen_loader.g.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app.dart';
import 'feature/login_signup/bloc/list_hospital_extra/bloc_list_hospital_extra.dart';
import 'feature/onboarding/bloc/slider/bloc_slider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  final MultiBlocProvider blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<SliderBloc>(
        create: (BuildContext context) => SliderBloc(),
      ),
      BlocProvider<ChooseLocationBloc>(
        create: (BuildContext context) => ChooseLocationBloc(),
      ),
      BlocProvider<ListHospitalExtraBloc>(
        create: (BuildContext context) => ListHospitalExtraBloc(),
      ),
      BlocProvider<ListEducationBloc>(
        create: (BuildContext context) => ListEducationBloc(),
      ),
      BlocProvider<UploadImageBloc>(
        create: (BuildContext context) => UploadImageBloc(),
      ),
      BlocProvider<ListCertificationBloc>(
        create: (BuildContext context) => ListCertificationBloc(),
      ),
      BlocProvider<ListAwardBloc>(
        create: (BuildContext context) => ListAwardBloc(),
      ),
      BlocProvider<ListAdditionalBloc>(
        create: (BuildContext context) => ListAdditionalBloc(),
      ),
      BlocProvider<ListMedicationBloc>(
        create: (BuildContext context) => ListMedicationBloc(),
      ),
      BlocProvider<ListDoctorBloc>(
        create: (BuildContext context) => ListDoctorBloc(),
      ),
      BlocProvider<ListConditionBloc>(
        create: (BuildContext context) => ListConditionBloc(),
      ),
      BlocProvider<ListTipsBloc>(
        create: (BuildContext context) => ListTipsBloc(),
      ),
      BlocProvider<ListSavedBloc>(
        create: (BuildContext context) => ListSavedBloc(),
      ),
      BlocProvider<ListCreatedMeBloc>(
        create: (BuildContext context) => ListCreatedMeBloc(),
      ),
      BlocProvider<WorkingDayBloc>(
        create: (BuildContext context) => WorkingDayBloc(),
      ),
      BlocProvider<WorkingTimeBloc>(
        create: (BuildContext context) => WorkingTimeBloc(),
      ),
      BlocProvider<DarkModeBloc>(
        create: (BuildContext context) => DarkModeBloc(),
      ),
      BlocProvider<ListBankBloc>(
        create: (BuildContext context) => ListBankBloc(),
      ),
      BlocProvider<ListConditionTopicBloc>(
        create: (BuildContext context) => ListConditionTopicBloc(),
      ),
    ],
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('vi')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        saveLocale: false,
        useOnlyLangCode: true,
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://91728898c9b24bdd990de8bb7733551c@o889705.ingest.sentry.io/6115169';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(blocProvider),
  );
}
