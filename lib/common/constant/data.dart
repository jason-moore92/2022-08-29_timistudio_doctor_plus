import 'package:flutter_doctor_plus/common/model/chat_model.dart';
import 'package:flutter_doctor_plus/common/model/doctor_model.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_answer_model.dart';
import 'package:flutter_doctor_plus/common/model/free_consult_question_model.dart';
import 'package:flutter_doctor_plus/common/model/education_model.dart';
import 'package:flutter_doctor_plus/common/model/hospital_model.dart';
import 'package:flutter_doctor_plus/common/model/attachment_model.dart';
import 'package:flutter_doctor_plus/common/model/consult_details_model.dart';
import 'package:flutter_doctor_plus/common/model/medication_model.dart';
import 'package:flutter_doctor_plus/common/model/patient_review_model.dart';
import 'package:flutter_doctor_plus/common/model/photo_model.dart';
import 'package:flutter_doctor_plus/common/model/question_model.dart';
import 'package:flutter_doctor_plus/common/model/review_model.dart';
import 'package:flutter_doctor_plus/common/model/tip_model.dart';
import 'package:flutter_doctor_plus/common/model/topic_model.dart';
import 'package:flutter_doctor_plus/common/model/with_draw_model.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';
import 'dart:math';
import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/common/model/event_model.dart';
import 'package:flutter_doctor_plus/common/model/notification_item_model.dart';
import 'package:flutter_doctor_plus/common/model/patient_model.dart';
import 'package:flutter_doctor_plus/common/constant/enum.dart';

const DoctorModel user = DoctorModel(
    avt: avtDoctor1,
    name: 'Dr. Martin Wallace',
    specialities: [
      SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
      SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
    ],
    experience: [
      ExperienceModel(
          title: 'I am licensed to see patients from', answer: 'Florida'),
      ExperienceModel(title: 'Work Experience', answer: '14 years'),
      ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
    ],
    aboutMe:
        "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
    place: 'Sun City, AZ 85351',
    education: [
      EducationModel(
          medicalSchool: 'Boston University School of Medicine',
          educated: 'FCPS, MBBS, Clinical Medicine',
          degree: "MD '06",
          year: '1985')
    ],
    certiAward: [
      CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
      CertiAwardModel(title: 'AMA Scientific Achievement Award', time: '2001'),
      CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
    ],
    insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
    phone: '481-766-6767',
    reviews: 141,
    patients: 248,
    savedLives: 423,
    helpedPeople: 423200,
    thanksFor: 24200,
    rate: 4.6,
    id: 0);

const DoctorModel currentUser = DoctorModel(
  id: 0,
  avt: avtDoctor1,
  name: 'Huy Bach',
  specialities: [
    SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
    SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
  ],
  experience: [
    ExperienceModel(
        title: 'I am licensed to see patients from', answer: 'Florida'),
    ExperienceModel(title: 'Work Experience', answer: '14 years'),
    ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
  ],
  aboutMe:
      "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
  place: 'Sun City, AZ 85351',
  education: [
    EducationModel(
        medicalSchool: 'Boston University School of Medicine',
        educated: 'FCPS, MBBS, Clinical Medicine',
        degree: "MD '06",
        year: '1985')
  ],
  certiAward: [
    CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
    CertiAwardModel(title: 'AMA Scientific Achievement Award', time: '2001'),
    CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
  ],
  insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
  phone: '481-766-6767',
  reviews: 141,
  patients: 248,
  savedLives: 423,
  helpedPeople: 423200,
  thanksFor: 24200,
  rate: 4.6,
);

const List<String> labels = [
  '#',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'V',
  'X',
  'Y',
  'Z'
];

List<MedicationModel> medicationsDemo = [
  MedicationModel(
      nameMedication: LocaleKeys.abilify.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.acetaminophen.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.acyclovir.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.adderall.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.advair.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.advairDiskus.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.advil.tr(),
      description: LocaleKeys.acyclovirIs.tr()),
  MedicationModel(
      nameMedication: LocaleKeys.albuterol.tr(),
      description: LocaleKeys.acyclovirIs.tr())
];

List<String> allMedication = [
  LocaleKeys.abilify.tr(),
  LocaleKeys.acetaminophen.tr(),
  LocaleKeys.acyclovir.tr(),
  LocaleKeys.adderall.tr(),
  LocaleKeys.advair.tr(),
  LocaleKeys.advairDiskus.tr(),
  LocaleKeys.advil.tr(),
  LocaleKeys.albuterol.tr()
];

List<String> allCondition = [
  'Abdominal aortic aneurysm',
  'Acne',
  'Acute cholecystitis',
  'Acute lymphoblastic leukaemia',
  'Acute lymphoblastic leukaemia: Children',
  'Allergic rhinitis',
  'Allergies',
  "Alzheimer's disease",
  "Binge eating",
  'Bladder cancer',
  'Bipolar disorder',
  'Blood poisoning (sepsis)',
  'Bone cancer: Teenagers and young adultss',
  'Bowel incontinence',
  'Bowel polyps'
];

List<Map<String, dynamic>> messageList = [
  {'message': "Hello. How’r you?", 'sender': 'me', 'type': "message"},
  {
    'message': 'Hi Doctor. I’m fine. Thanks',
    'sender': 'you',
    'type': "message"
  },
  {
    'message':
        'My daughter is 3 years old and she didn’t well from 2 days ago.',
    'sender': 'you',
    'type': "message"
  },
  {
    'message': 'Does she has others symptoms?',
    'sender': 'me',
    'type': "message"
  },
  {
    'message': 'She didn’t eat well since 1 week',
    'sender': 'you',
    'type': "message"
  },
  {
    'message': 'Does she has others symptoms?',
    'sender': 'me',
    'type': "message"
  },
];
PatientModel patientDemo = PatientModel(
  name: "Devin Shelton",
  age: 30,
  avatar: patientAvatar1,
  dateOfBirth: DateTime(1990, 7, 6),
  place: '150 Greene St, NY 10012',
  height: 180,
  weight: 72,
  bmi: 22.2,
  bloodType: 'B',
  isMale: true,
  phone: '968-926-0227',
);
List<PatientModel> patients = [
  PatientModel(
    name: "Sarah Conor",
    avatar: patientAvatar1,
    dateOfBirth: DateTime.utc(1999),
    isMale: true,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Mary Jane",
    avatar: patientAvatar2,
    dateOfBirth: DateTime.utc(1972),
    isMale: false,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Sandra Clair",
    avatar: patientAvatar3,
    dateOfBirth: DateTime.utc(1962),
    isMale: false,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Ando Takumi",
    avatar: patientAvatar4,
    dateOfBirth: DateTime.utc(1969),
    isMale: true,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Sarah Conor",
    avatar: patientAvatar1,
    dateOfBirth: DateTime.utc(1999),
    isMale: true,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Mary Jane",
    avatar: patientAvatar2,
    dateOfBirth: DateTime.utc(1972),
    isMale: false,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Sandra Clair",
    avatar: patientAvatar3,
    dateOfBirth: DateTime.utc(1962),
    isMale: false,
    phone: '571-630-6203',
  ),
  PatientModel(
    name: "Ando Takumi",
    avatar: patientAvatar4,
    dateOfBirth: DateTime.utc(1969),
    isMale: true,
    phone: '571-630-6203',
  ),
];

List<DoctorModel> doctorsDemo = const [
  user,
  DoctorModel(
      id: 1,
      avt: avtDoctor1,
      isMyNetwork: false,
      name: 'Dr. Jordan Singleton',
      specialities: [
        SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
        SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
      ],
      experience: [
        ExperienceModel(
            title: 'I am licensed to see patients from', answer: 'Florida'),
        ExperienceModel(title: 'Work Experience', answer: '14 years'),
        ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
      ],
      aboutMe:
          "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
      place: 'Sun City, AZ 85351',
      education: [
        EducationModel(
            medicalSchool: 'Boston University School of Medicine',
            educated: 'FCPS, MBBS, Clinical Medicine',
            degree: "MD '06",
            year: '1985')
      ],
      certiAward: [
        CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
        CertiAwardModel(
            title: 'AMA Scientific Achievement Award', time: '2001'),
        CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
      ],
      insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
      phone: '481-766-6767',
      reviews: 141,
      patients: 248,
      savedLives: 423,
      helpedPeople: 423200,
      thanksFor: 24200,
      rate: 4.6),
  DoctorModel(
      id: 2,
      avt: avtDoctor2,
      name: 'Dr. Margaret Wells',
      specialities: [
        SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
        SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
      ],
      experience: [
        ExperienceModel(
            title: 'I am licensed to see patients from', answer: 'Florida'),
        ExperienceModel(title: 'Work Experience', answer: '14 years'),
        ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
      ],
      aboutMe:
          "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
      place: 'Temple Hills, MD 20748',
      education: [
        EducationModel(
            medicalSchool: 'Boston University School of Medicine',
            educated: 'FCPS, MBBS, Clinical Medicine',
            degree: "MD '06",
            year: '1985')
      ],
      certiAward: [
        CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
        CertiAwardModel(
            title: 'AMA Scientific Achievement Award', time: '2001'),
        CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
      ],
      insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
      phone: '481-766-6767',
      reviews: 1387,
      patients: 248,
      savedLives: 423,
      helpedPeople: 423200,
      thanksFor: 24200,
      rate: 4.8),
  DoctorModel(
      id: 3,
      avt: avtDoctor3,
      name: 'Dr.Christine Bradley',
      specialities: [
        SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
        SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
      ],
      experience: [
        ExperienceModel(
            title: 'I am licensed to see patients from', answer: 'Florida'),
        ExperienceModel(title: 'Work Experience', answer: '14 years'),
        ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
      ],
      aboutMe:
          "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
      place: 'Fresno, CA 93706',
      education: [
        EducationModel(
            medicalSchool: 'Boston University School of Medicine',
            educated: 'FCPS, MBBS, Clinical Medicine',
            degree: "MD '06",
            year: '1985')
      ],
      certiAward: [
        CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
        CertiAwardModel(
            title: 'AMA Scientific Achievement Award', time: '2001'),
        CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
      ],
      insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
      phone: '481-766-6767',
      reviews: 141,
      patients: 248,
      savedLives: 423,
      helpedPeople: 423200,
      thanksFor: 24200,
      rate: 4.8),
  DoctorModel(
      id: 4,
      avt: avtDoctor2,
      isMyNetwork: false,
      name: 'Dr.Magaret Well',
      specialities: [
        SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
        SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
      ],
      experience: [
        ExperienceModel(
            title: 'I am licensed to see patients from', answer: 'Florida'),
        ExperienceModel(title: 'Work Experience', answer: '14 years'),
        ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
      ],
      aboutMe:
          "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
      place: 'Fresno, CA 93706',
      education: [
        EducationModel(
            medicalSchool: 'Boston University School of Medicine',
            educated: 'FCPS, MBBS, Clinical Medicine',
            degree: "MD '06",
            year: '1985')
      ],
      certiAward: [
        CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
        CertiAwardModel(
            title: 'AMA Scientific Achievement Award', time: '2001'),
        CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
      ],
      insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
      phone: '481-766-6767',
      reviews: 141,
      patients: 248,
      savedLives: 423,
      helpedPeople: 423200,
      thanksFor: 24200,
      rate: 4.8),
  DoctorModel(
      id: 5,
      avt: avtDoctor3,
      isMyNetwork: false,
      name: 'Dr.Christine Bradley',
      specialities: [
        SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
        SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
      ],
      experience: [
        ExperienceModel(
            title: 'I am licensed to see patients from', answer: 'Florida'),
        ExperienceModel(title: 'Work Experience', answer: '14 years'),
        ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
      ],
      aboutMe:
          "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
      place: 'Fresno, CA 93706',
      education: [
        EducationModel(
            medicalSchool: 'Boston University School of Medicine',
            educated: 'FCPS, MBBS, Clinical Medicine',
            degree: "MD '06",
            year: '1985')
      ],
      certiAward: [
        CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
        CertiAwardModel(
            title: 'AMA Scientific Achievement Award', time: '2001'),
        CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
      ],
      insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
      phone: '481-766-6767',
      reviews: 141,
      patients: 248,
      savedLives: 423,
      helpedPeople: 423200,
      thanksFor: 24200,
      rate: 4.8)
];

List<DoctorModel> doctorsMaybeKnowDemo = const [
  DoctorModel(
      id: 6,
      avt: avtDoctor1,
      name: 'Dr. Jesus Nash',
      specialities: [
        SpecialityModel(icon: icHealthGuide, nameSpec: 'Family Medicine'),
        SpecialityModel(icon: icHeart, nameSpec: 'Cardiology')
      ],
      experience: [
        ExperienceModel(
            title: 'I am licensed to see patients from', answer: 'Florida'),
        ExperienceModel(title: 'Work Experience', answer: '14 years'),
        ExperienceModel(title: 'Language', answer: 'English, Spanish, French')
      ],
      aboutMe:
          "Dr. Martin Wallace is Board Certified in Allergy and Immunology and Pediatrics and a South Jersey 'Top Doc'. With over 23 years' private practice experience,…",
      place: 'Sun City, AZ 85351',
      education: [
        EducationModel(
            medicalSchool: 'Boston University School of Medicine',
            educated: 'FCPS, MBBS, Clinical Medicine',
            degree: "MD '06",
            year: '1985')
      ],
      certiAward: [
        CertiAwardModel(title: 'Medicine Award Winners', time: '1990'),
        CertiAwardModel(
            title: 'AMA Scientific Achievement Award', time: '2001'),
        CertiAwardModel(title: 'APUA Leadership Award', time: '2016')
      ],
      insurance: ['Aetna', 'AmeriHealth', 'BlueCross BlueShield', 'Cigna'],
      phone: '481-766-6767',
      reviews: 141,
      patients: 248,
      savedLives: 423,
      helpedPeople: 423200,
      thanksFor: 24200,
      rate: 4.6)
];
List<String> services = [
  'Angioplasty',
  'Breast Cancer Screening',
  'Cardiac Cath Lab',
  'Emergency Department',
  'End of Life Services: Hospice Program',
  'General Medical Surgical',
  'Geriatric Services',
  'HIV-AIDS Services',
  'Health Screenings',
  'Hemodialysis'
];

List<ChatModel> usersOnline = [
  const ChatModel(avt: [avt1], name: 'Dr. Mattie Harper', online: true),
  const ChatModel(avt: [avt2], name: 'Dr. Lina Thompson', online: true),
  const ChatModel(avt: [avt3], name: 'Dr. Dylan Oliver'),
  const ChatModel(avt: [avtDoctor1], name: 'Dr. Agnes Kim'),
  const ChatModel(avt: [avtDoctor3], name: 'Dr. Mattie Harper'),
];

List<ChatModel> chats = [
  ChatModel(
      avt: const [avt1, avtDoctor2],
      name: 'NYC Hospital',
      currentMessage: 'Let me check his medical...',
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now().subtract(const Duration(hours: 2)),
      online: true),
  ChatModel(
      avt: const [avt1],
      name: 'Dr. Margaret Wells',
      currentMessage: 'I sent your patient contact...',
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now().subtract(const Duration(hours: 2)),
      online: true),
  ChatModel(
      avt: const [avt2],
      name: 'Dr. Christine Bradley',
      currentMessage: 'How do you think?',
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now(),
      online: true),
  ChatModel(
      avt: const [avt3],
      name: 'Dr. Dylan Oliver',
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now(),
      currentMessage: 'Yes!'),
  ChatModel(
      avt: const [avtDoctor1],
      name: 'Dr. Marguerite Sutton',
      currentMessage: "Ok. I got it. Thank you",
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now()),
  ChatModel(
      avt: const [avtDoctor2],
      name: 'Dr. Lina Thompson',
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now(),
      currentMessage: "That's good idea! I think so."),
  ChatModel(
      avt: const [avtDoctor3],
      name: 'Dr. Lina Thompson',
      currentMessTime: DateTime.now(),
      currentTimeIncome: DateTime.now(),
      currentMessage: "That's good idea! I think so."),
];

List<HospitalModel> hospitals = const [
  HospitalModel(
      imageHospital: hospitalSpecial1,
      imageBackground: backgroundHospital,
      name: 'West End Pediatrics',
      address: '2 5th Ave Suite 8, NY 10011',
      reviews: 141,
      rate: 4.8,
      beds: 125,
      distance: 0.5,
      phoneNumber: '+1 212-523-5222'),
  HospitalModel(
      imageHospital: hospitalSpecial2,
      imageBackground: backgroundHospital,
      name: 'Student Health Center - New York University',
      address: '726 Broadway, NY 10003',
      reviews: 357,
      rate: 4.8,
      beds: 125,
      distance: 1,
      phoneNumber: '+1 212-523-5222'),
  HospitalModel(
      imageHospital: hospitalSpecial3,
      imageBackground: backgroundHospital,
      name: 'Rate My Hospital',
      address: '2 5th Ave Suite 8, NY 10011',
      reviews: 75,
      rate: 4.8,
      beds: 125,
      distance: 1.5,
      phoneNumber: '+1 212-523-5222'),
  HospitalModel(
      imageHospital: hospitalSpecial4,
      imageBackground: backgroundHospital,
      name: 'Mount Sinai St. Luke’s Hospital Breast Center',
      address: '217 Grand St, NY 10013',
      reviews: 141,
      rate: 4.8,
      beds: 125,
      distance: 2,
      phoneNumber: '+1 212-523-5222')
];

List<NotificationItemModel> notificationList = [
  NotificationItemModel(
    status: StatusType.accepted,
    type: ConsultType.appointment,
    patient: patients[0],
    time: "08:00 PM",
    notificationTime: "now",
    isUnread: true,
  ),
  const NotificationItemModel(
    type: "account",
    isUnread: true,
  ),
  const NotificationItemModel(
    type: "bank",
    isUnread: true,
  ),
  NotificationItemModel(
    status: StatusType.accepted,
    type: ConsultType.voice,
    patient: patients[1],
    time: "08:20 AM",
    notificationTime: "now",
    isUnread: true,
  ),
  NotificationItemModel(
    status: StatusType.accepted,
    type: ConsultType.message,
    patient: patients[2],
    notificationTime: "4h ago",
  ),
  NotificationItemModel(
    status: StatusType.iCancelled,
    type: ConsultType.voice,
    patient: patients[3],
    notificationTime: "Yesterday, 09:58 PM",
  ),
  NotificationItemModel(
    status: StatusType.accepted,
    type: ConsultType.appointment,
    patient: patients[0],
    time: "08:00 PM",
    notificationTime: "Yesterday, 09:23 PM",
  ),
  NotificationItemModel(
    status: StatusType.accepted,
    type: ConsultType.voice,
    patient: patients[1],
    time: "08:20 AM",
    notificationTime: "Yesterday, 4:45 PM",
  ),
  NotificationItemModel(
    status: StatusType.accepted,
    type: ConsultType.message,
    patient: patients[2],
    notificationTime: "Yesterday, 10:28 AM",
  ),
  NotificationItemModel(
    status: StatusType.iCancelled,
    type: ConsultType.voice,
    patient: patients[3],
    notificationTime: "Yesterday, 8:58 AM",
  ),
];

List<EventModel> listEvents = [
  EventModel(
    title: '1',
    time: DateTime.now(),
    status: StatusType.accepted,
    type: ConsultType.appointment,
    patient: patients[Random().nextInt(4)],
  ),
  EventModel(
    title: '2',
    time: DateTime.now(),
    status: StatusType.inProgress,
    type: ConsultType.liveChat,
    patient: patients[Random().nextInt(4)],
  ),
  EventModel(
    title: '3',
    time: DateTime.now(),
    status: StatusType.unconfirmed,
    type: ConsultType.video,
    patient: patients[Random().nextInt(4)],
  ),
  EventModel(
    title: '4',
    time: DateTime.now(),
    status: StatusType.completed,
    type: ConsultType.video,
    patient: patients[Random().nextInt(4)],
    review: const PatientReviewModel(
      note:
          'I found the answers provided by Dr. Martin Wallace to be knowledge, caring, inspiring, well-reasoned and professional.',
      rate: 4,
    ),
  ),
  EventModel(
    title: '5',
    time: DateTime.now(),
    status: StatusType.patientCancelled,
    type: ConsultType.voice,
    patient: patients[Random().nextInt(3)],
  ),
  EventModel(
    title: '6',
    time: DateTime.now(),
    status: StatusType.inProgress,
    type: ConsultType.message,
    patient: patients[Random().nextInt(3)],
  ),
  ...List.generate(
    50,
    (index) => EventModel(
      title: "$index",
      time: DateTime.utc(DateTime.now().year, DateTime.now().month, index),
      type: Random().nextInt(100) % 4 == 0
          ? ConsultType.appointment
          : Random().nextInt(100) % 4 == 1
              ? ConsultType.liveChat
              : Random().nextInt(100) % 4 == 2
                  ? ConsultType.message
                  : Random().nextInt(100) % 4 == 3
                      ? ConsultType.video
                      : ConsultType.voice,
      status: Random().nextInt(100) % 4 == 0
          ? StatusType.accepted
          : Random().nextInt(100) % 4 == 1
              ? StatusType.unconfirmed
              : Random().nextInt(100) % 4 == 2
                  ? StatusType.inProgress
                  : Random().nextInt(100) % 4 == 3
                      ? StatusType.completed
                      : (StatusType.iCancelled),
      patient: patients[Random().nextInt(4)],
    ),
  )
];

const ConsultDetailsModel consultDetails = ConsultDetailsModel(
  title: 'For her daughter, 3 years old',
  details:
      'I think my child has been exposed to chickenpox, what should I do? How long does it take to show signs of chickenpox after being exposed?',
  attachment: sampleAttachment,
);

const AttachmentModel sampleAttachment = AttachmentModel(
  image: imgChickenpox,
  description: 'Redness on the back of the neck',
);

List<TipModel> tips = const [
  TipModel(
      titleTip: 'Quitting smoking',
      nameDoctor: 'Dr. Sarah Conner',
      avtDoctor: avt1,
      description:
          'Quitting smoking is the process of discontinuing the use of inhaled tobacco products.',
      interestingFact:
          "Smoking is the number one cause of preventable death in the United States.",
      image: imgTopic2,
      shares: 1200,
      thanks: 12500)
];

List<TopicModel> topics = const [
  TopicModel(
      titleTopic: 'Air Pollution',
      nameDoctor: 'Dr Russell Chavez',
      description:
          'Air pollution is the introduction of chemicals and other materials into the atmosphere that cause harm to living organisms and the natural environment.',
      avtDoctor: avtDoctor2,
      image: imgTopic1,
      subTitle: [
        'Allergy',
        'Immunology'
      ],
      questions: [
        QuestionModel(
            question:
                'How can air pollution effect health? What are the health effects of air pollution?')
      ]),
  TopicModel(
      titleTopic: 'Taminflu',
      nameDoctor: 'Dr Blake Gomez',
      description:
          'Air pollution is the introduction of chemicals and other materials into the atmosphere that cause harm to living organisms and the natural environment.',
      avtDoctor: avtDoctor3,
      image: imgTopic2,
      subTitle: [
        'Allergy',
        'Immunology'
      ],
      questions: [
        QuestionModel(
            question:
                'How can air pollution effect health? What are the health effects of air pollution?')
      ])
];

List<TipModel> healthGuidesCreatedByMe = [
  TipModel(
      avtDoctor: user.avt,
      enrolled: 543,
      nameDoctor: user.name,
      image: image1,
      forPatientWho: const ['are male', 'is over 18 years of age'],
      patientDo: const [
        PatientDoModel(
            action:
                'Get blood test for HIV / AIDS up to age 65 and if high risk',
            time: 'Yearly'),
        PatientDoModel(
            action:
                'Get DTaP (whooping cough) vaccine, plus tetanus shots every 10 years',
            time: 'Once'),
        PatientDoModel(
            action:
                'Get the human papillomavirus (HPV) vaccine (three shots) before age 27',
            time: 'Once'),
        PatientDoModel(
            action:
                "Get chicken pox (varicella) vaccine if you haven't already or are immune",
            time: 'Yearly')
      ],
      titleTip: 'Getting Flat Abs'),
  TipModel(
      avtDoctor: user.avt,
      enrolled: 543,
      nameDoctor: user.name,
      image: image2,
      forPatientWho: const ['are male', 'is over 18 years of age'],
      patientDo: const [
        PatientDoModel(
            action:
                'Get blood test for HIV / AIDS up to age 65 and if high risk',
            time: 'Yearly'),
        PatientDoModel(
            action:
                'Get DTaP (whooping cough) vaccine, plus tetanus shots every 10 years',
            time: 'Once'),
        PatientDoModel(
            action:
                'Get the human papillomavirus (HPV) vaccine (three shots) before age 27',
            time: 'Once'),
        PatientDoModel(
            action:
                "Get chicken pox (varicella) vaccine if you haven't already or are immune",
            time: 'Yearly')
      ],
      titleTip: 'Improving Heart Health')
];

List<TipModel> healthGuidesSaved = const [
  TipModel(
      avtDoctor: avtDoctor1,
      enrolled: 543,
      nameDoctor: "Dr. Joanna Banks",
      image: image3,
      forPatientWho: ['are male', 'is over 18 years of age'],
      patientDo: [
        PatientDoModel(
            action:
                'Get blood test for HIV / AIDS up to age 65 and if high risk',
            time: 'Yearly'),
        PatientDoModel(
            action:
                'Get DTaP (whooping cough) vaccine, plus tetanus shots every 10 years',
            time: 'Once'),
        PatientDoModel(
            action:
                'Get the human papillomavirus (HPV) vaccine (three shots) before age 27',
            time: 'Once'),
        PatientDoModel(
            action:
                "Get chicken pox (varicella) vaccine if you haven't already or are immune",
            time: 'Yearly')
      ],
      titleTip: 'Being a Healthy Man'),
  TipModel(
      avtDoctor: avtDoctor2,
      enrolled: 543,
      nameDoctor: "Dr. Viola Hernandez",
      image: image4,
      forPatientWho: ['are male', 'is over 18 years of age'],
      patientDo: [
        PatientDoModel(
            action:
                'Get blood test for HIV / AIDS up to age 65 and if high risk',
            time: 'Yearly'),
        PatientDoModel(
            action:
                'Get DTaP (whooping cough) vaccine, plus tetanus shots every 10 years',
            time: 'Once'),
        PatientDoModel(
            action:
                'Get the human papillomavirus (HPV) vaccine (three shots) before age 27',
            time: 'Once'),
        PatientDoModel(
            action:
                "Get chicken pox (varicella) vaccine if you haven't already or are immune",
            time: 'Yearly')
      ],
      titleTip: 'Improving Heart Health')
];

List<TipModel> healthTips = [
  TipModel(
      avtDoctor: user.avt,
      thanks: 125,
      shares: 13,
      nameDoctor: user.name,
      image: image5,
      description:
          'Allergy testing with pre-pen and penicillin g can accurately diagnose people with penicillin allergy.',
      titleTip: 'Treating Skin Allergies'),
  TipModel(
      avtDoctor: user.avt,
      thanks: 125,
      shares: 13,
      nameDoctor: user.name,
      image: image6,
      description:
          'Allergy testing with pre-pen and penicillin g can accurately diagnose people with penicillin allergy.',
      titleTip: 'Flu & Cold')
];

List<FreeConsultQuestionModel> freeConsultQuestions = [
  FreeConsultQuestionModel(
    title: "Is it possible for people recover from a corona radiator stroke?",
    doctorsFollowed: [doctorsDemo[2]],
    answers: [answers[0]],
  ),
  FreeConsultQuestionModel(
    title:
        "Please provide some do's and don'ts for people who are sick with the flu or a cold.",
    doctorsFollowed: [...doctorsDemo],
    answers: [answers[2]],
  ),
  FreeConsultQuestionModel(
    title: "Is it possible for people recover from a corona radiator stroke?",
    doctorsFollowed: [...doctorsDemo],
    answers: [answers[1], answers[2]],
  ),
  FreeConsultQuestionModel(
    title: "What does a tender abdomen after painful stomach flu mean?",
    doctorsFollowed: [...doctorsDemo],
    answers: answers,
  ),
];

List<FreeConsultAnswerModel> answers = [
  FreeConsultAnswerModel(
    doctor: doctorsDemo[1],
    answer:
        "If you're sick, limit touching of other people's work environments (phones, keyboards, mouses).",
    attachment: sampleAttachment,
    thanks: 125,
    doctorsAgreed: [
      doctorsDemo[0],
    ],
  ),
  FreeConsultAnswerModel(
    doctor: doctorsDemo[2],
    answer:
        "Always use your own pen at the doctor's office and not the pen 100's of infected patients touched.",
    attachment: sampleAttachment,
    thanks: 21,
  ),
  FreeConsultAnswerModel(
    doctor: doctorsDemo[3],
    answer:
        "Plane seat pockets (sick passengers put dirty tissues), tray tables have MRSA 60%, avoid blankets.",
    thanks: 1,
  ),
  FreeConsultAnswerModel(
    doctor: doctorsDemo[0],
    answer: "Sample Answer",
    attachment: sampleAttachment,
    thanks: 100000,
    doctorsAgreed: [...doctorsDemo],
  ),
];
List<PhotoModel> photos = [
  PhotoModel(
      namePhoto: 'Photo_28920.JPG', image: library1, uploaded: DateTime.now()),
  PhotoModel(
      namePhoto: 'Photo_28920.JPG', image: library2, uploaded: DateTime.now()),
  PhotoModel(
      namePhoto: 'Photo_28920.JPG', image: library3, uploaded: DateTime.now()),
  PhotoModel(
      namePhoto: 'Photo_28920.JPG', image: library4, uploaded: DateTime.now()),
];

List<ReviewModel> reviews = [
  ReviewModel(
      id: 1,
      avt: patientAvatar1,
      date: DateTime.now(),
      name: 'Myra Douglas',
      rate: 5.0,
      review:
          'Dr. Martin Wallace provides answers that are inspring and sensible. I know that but what lifestyle and food I need to know that?'),
  ReviewModel(
      id: 2,
      avt: patientAvatar2,
      date: DateTime.now(),
      name: 'Nancy Beck',
      rate: 4.9,
      review:
          'I found the answers provided by Dr. Martin Wallace to be knowledge, caring, inspring, well-reasoned and professional.')
];

List<String> conditions = [
  'Abdominal aortic aneurysm',
  'Acne',
  'Acute cholecystitis',
  'Acute lymphoblastic leukaemia',
  'Acute lymphoblastic leukaemia: Children',
  'Allergic rhinitis',
  'Allergies',
  "Alzheimer's disease"
];

List<WithDrawModel> withDraws = const [
  WithDrawModel(
      id: 0,
      title: 'Payout December',
      subTitle: '09:15 AM 01/02/2020',
      price: 8120),
  WithDrawModel(
      id: 1,
      title: 'Payout November',
      subTitle: '10:15 AM 12/01/2019',
      price: 6450),
  WithDrawModel(
      id: 2,
      title: 'Payout Octorber',
      subTitle: '04:27 PM 11/03/2019',
      price: 5280),
  WithDrawModel(
      id: 3,
      title: 'Payout September',
      subTitle: '10:15 AM 10/02/2019',
      price: 6790),
  WithDrawModel(
      id: 4,
      title: 'Payout August',
      subTitle: '10:15 AM 09/03/2019',
      price: 6450)
];
