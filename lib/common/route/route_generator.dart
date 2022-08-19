import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/feature/account/screen/account.dart';
import 'package:flutter_doctor_plus/feature/account/screen/add_new.dart';
import 'package:flutter_doctor_plus/feature/account/screen/bank_deposit.dart';
import 'package:flutter_doctor_plus/feature/account/screen/invite_expert_for_you.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/past_consults_filter.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/share_doctor.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/write_an_answer.dart';
import 'package:flutter_doctor_plus/feature/finance_report/screen/finance_report.dart';
import 'package:flutter_doctor_plus/feature/finance_report/screen/income_report.dart';
import 'package:flutter_doctor_plus/feature/finance_report/screen/withdraw_history.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/health_feed.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/tip_detail.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/topic_detail.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/topic_detail_conditions.dart';
import 'package:flutter_doctor_plus/feature/free_consults/screens/free_consult_question.dart';
import 'package:flutter_doctor_plus/feature/free_consults/screens/free_consults.dart';
import 'package:flutter_doctor_plus/feature/live_chat/screen/service_live_chat.dart';
import 'package:flutter_doctor_plus/feature/live_chat/screen/share_medication.dart';
import 'package:flutter_doctor_plus/feature/home_schedule/screen/bottom_navigation.dart';
import 'package:flutter_doctor_plus/feature/home_schedule/screen/schedule.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/change_new_password.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/change_pass_success.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/forgot_password.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/login.dart';
import 'package:flutter_doctor_plus/feature/home_schedule/screen/notification_screen.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/select_address.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/sent_verify_success.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/sign_up.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/sign_up_success.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/update_profile_step_one.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/update_profile_step_three.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/update_profile_step_two.dart';
import 'package:flutter_doctor_plus/feature/login_signup/screen/verify_phone.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/call_ended.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/next_consult_detail.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/consult_screen.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/ongoing_call.dart';
import 'package:flutter_doctor_plus/feature/consults/screen/report_problem.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/screen/add_new_guide.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/screen/add_new_tip.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/screen/health_guide.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/screen/health_guide_detail.dart';
import 'package:flutter_doctor_plus/feature/my_work_health_guide/screen/health_tips.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/library.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/my_network.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/online_appointment.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/profile_management.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/send_message.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/service_management.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/set_working_day.dart';
import 'package:flutter_doctor_plus/feature/my_work_library/screen/set_working_time.dart';
import 'package:flutter_doctor_plus/feature/my_work_topics/screen/topic_add_condition.dart';
import 'package:flutter_doctor_plus/feature/my_work_topics/screen/topic_create.dart';
import 'package:flutter_doctor_plus/feature/my_work_topics/screen/topics.dart';
import 'package:flutter_doctor_plus/feature/patient_management/screen/patient_filter.dart';
import 'package:flutter_doctor_plus/feature/patient_management/screen/patient_management.dart';
import 'package:flutter_doctor_plus/feature/patient_management/screen/patient_profile.dart';
import 'package:flutter_doctor_plus/feature/private_chat/screen/chat_detail.dart';
import 'package:flutter_doctor_plus/feature/private_chat/screen/private_chat.dart';
import 'package:flutter_doctor_plus/feature/private_video_call/screens/video_call.dart';
import 'package:flutter_doctor_plus/feature/private_video_call/screens/video_call_end.dart';
import 'package:flutter_doctor_plus/feature/search/screens/doctor_filter.dart';
import 'package:flutter_doctor_plus/feature/search/screens/search_screen.dart';
import 'package:flutter_doctor_plus/feature/search/screens/search_result.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/expert_profile.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/medication_detail.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/search_condition.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/search_doctor.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/search_doctor_around_me.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/special_hospital.dart';
import 'package:flutter_doctor_plus/feature/search_special/screen/special_hospital_detail.dart';

import 'routes.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// route catalog Login
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Login(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ForgotPassword(),
        );
      case Routes.changePassword:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ChangeNewPassword(),
        );
      case Routes.changePassSuccess:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ChangePassSuccess(),
        );
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SignUp(),
        );
      case Routes.verifyPhone:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const VerifyPhone(),
        );
      case Routes.signUpSuccess:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SignUpSuccess(),
        );
      case Routes.updateProfileStepOne:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const UpdateProfileStepOne(),
        );
      case Routes.updateProfileStepTwo:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const UpdateProfileStepTwo(),
        );
      case Routes.updateProfileStepThree:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const UpdateProfileStepThree(),
        );
      case Routes.selectAddress:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SelectAddress(),
        );
      case Routes.sentVerifySuccess:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SentVerifySuccess(),
        );
      case Routes.shareMedication:
        final arg = settings.arguments as ShareMedication;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ShareMedication(hasShare: arg.hasShare),
        );
      case Routes.serviceLiveChat:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ServiceLiveChat(),
        );
      //route home && schedule
      case Routes.home:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BottomNavigation(),
        );
      case Routes.notification:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const NotificationScreen(),
        );
      case Routes.schedule:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Schedule(),
        );

      // route consults
      case Routes.nextConsults:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ConsultScreen(),
        );
      case Routes.nextConsultDetails:
        final arg = settings.arguments as NextConsultDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) => NextConsultDetail(item: arg.item),
        );
      case Routes.ongoingCall:
        final arg = settings.arguments as OngoingCall;
        return MaterialPageRoute<dynamic>(
          builder: (context) => OngoingCall(patient: arg.patient),
        );
      case Routes.callEnded:
        final arg = settings.arguments as CallEnded;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CallEnded(patient: arg.patient),
        );
      case Routes.reportProblem:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ReportProblem(),
        );
      case Routes.pastConsultsFilter:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PastConsultsFilter(),
        );
      case Routes.writeAnAnswer:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const WriteAnAnswer(),
        );
      case Routes.shareDoctor:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ShareDoctor(),
        );

      // route video call
      case Routes.videoCall:
        final arg = settings.arguments as VideoCall;
        return MaterialPageRoute<dynamic>(
          builder: (context) => VideoCall(patient: arg.patient),
        );
      case Routes.videoEnded:
        final arg = settings.arguments as VideoCallEnded;
        return MaterialPageRoute<dynamic>(
          builder: (context) => VideoCallEnded(patient: arg.patient),
        );

      //route free consults
      case Routes.freeConsults:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const FreeConsults(),
        );
      case Routes.freeConsultQuestion:
        final arg = settings.arguments as FreeConsultQuestion;
        return MaterialPageRoute<dynamic>(
          builder: (context) => FreeConsultQuestion(question: arg.question),
        );

      //route search
      case Routes.search:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Search(),
        );
      case Routes.searchResult:
        final arg = settings.arguments as SearchResult;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SearchResult(searchText: arg.searchText),
        );
      case Routes.doctorFilter:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const DoctorFilter(),
        );

      // route patient management
      case Routes.patientManagement:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PatientManagement(),
        );
      case Routes.filter:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PatientFilter(),
        );
      case Routes.patientProfile:
        final PatientProfile patientProfile =
            settings.arguments as PatientProfile;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              PatientProfile(patientModel: patientProfile.patientModel),
        );
      //route search specials
      case Routes.searchDoctor:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SearchDoctor(),
        );
      case Routes.searchDoctorAroundMe:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SearchDoctorAroundMe(),
        );
      case Routes.expertProfile:
        final ExpertProfile expertProfile = settings.arguments as ExpertProfile;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ExpertProfile(doctorModel: expertProfile.doctorModel),
        );
      case Routes.searchCondition:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SearchCondition(),
        );
      case Routes.medicationDetail:
        final MedicationDetail medicationDetail =
            settings.arguments as MedicationDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) => MedicationDetail(
            medicationModel: medicationDetail.medicationModel,
          ),
        );
      case Routes.specialHospital:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SpecialHospital(),
        );
      case Routes.hospitalDetail:
        final SpecialHospitalDetail specialHospitalDetail =
            settings.arguments as SpecialHospitalDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SpecialHospitalDetail(
              hospitalModel: specialHospitalDetail.hospitalModel),
        );

      //route private chat
      case Routes.privateChat:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const PrivateChat(),
        );
      case Routes.chatDetail:
        final ChatDetail chatDetail = settings.arguments as ChatDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChatDetail(chatModel: chatDetail.chatModel),
        );
      //route health feed
      case Routes.healthFeed:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HealthFeed(),
        );
      case Routes.tipDetail:
        final TipDetail tipDetail = settings.arguments as TipDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) => TipDetail(tipModel: tipDetail.tipModel),
        );
      case Routes.topicDetail:
        final TopicDetail topicDetail = settings.arguments as TopicDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) => TopicDetail(topicModel: topicDetail.topicModel),
        );
      case Routes.topicDetailConditions:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const TopicDetailConditions(),
        );

      //route my work health guide, tips
      case Routes.healthGuide:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HealthGuide(),
        );
      case Routes.savedDetail:
        final HealthGuideDetail savedDetail =
            settings.arguments as HealthGuideDetail;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              HealthGuideDetail(tipModel: savedDetail.tipModel),
        );
      case Routes.addNewGuide:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const AddNewGuide(),
        );
      case Routes.addNewTip:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const AddNewTip(),
        );
      case Routes.healthTip:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HealthTips(),
        );
      //route my work health library
      case Routes.library:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Library(),
        );
      case Routes.myNetwork:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MyNetwork(),
        );
      case Routes.profileManagement:
        final ProfileManagement profileManagement =
            settings.arguments as ProfileManagement;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ProfileManagement(doctorModel: profileManagement.doctorModel),
        );
      case Routes.serviceManagement:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const ServiceManagement(),
        );
      case Routes.onlineAppointment:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const OnlineAppointment(),
        );
      case Routes.sendMessage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SendMessage(),
        );
      case Routes.setWorkingDay:
        final SetWorkingDay setWorkingDay = settings.arguments as SetWorkingDay;
        return MaterialPageRoute<dynamic>(
          builder: (context) => SetWorkingDay(
            dayWork: setWorkingDay.dayWork,
          ),
        );
      case Routes.setWorkingTime:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SetWorkingTime(),
        );
      //route account
      case Routes.account:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Account(),
        );
      case Routes.bankDeposit:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const BankDeposit(),
        );
      case Routes.addNew:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const AddNew(),
        );
      case Routes.inviteExpertForYou:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const InviteExpertForYou(),
        );
      //route topics
      case Routes.topics:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const Topics(),
        );
      case Routes.createTopic:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const AddTopic(),
        );
      case Routes.topicAddCondition:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const TopicAddCondition(),
        );

      //route finance report
      case Routes.financeReport:
        return MaterialPageRoute<dynamic>(
          builder: (context) => FinanceReport(),
        );
      case Routes.incomeReport:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const IncomeReport(),
        );
      case Routes.withDrawHistory:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const WithDrawHistory(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
