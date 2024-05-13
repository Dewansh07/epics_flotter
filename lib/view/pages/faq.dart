// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:epics_pj/view/pages/custom_text.dart';
import 'package:epics_pj/view/pages/faq_helper.dart';
import 'package:epics_pj/view/pages/profile_page.dart';
import 'package:epics_pj/view/pages/refer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:url_launcher/url_launcher.dart';

class FaQsView extends StatelessWidget {
  static const String route = "/faqs-view";
  const FaQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => Navigator.pop(context),
            child: Icon(FontAwesomeIcons.angleLeft)),
        elevation: 0,
        //
        title: CustomText(
          text: "faqs".tr,
          fontSize: 19,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CustomElevatedButton(
            elevation: 1,
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: Icons.call,
            iconSize: 30.0,
            textColor: Colors.blue,
            // iconColor: AppColors.black,
            buttonText: AppStrings.callTiming,
            onPressed: () async {
              final Uri url = Uri(
                scheme: AppStrings.tel,
                path: AppStrings.phoneNumber,
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                showSnackBar(context: context, message: "cannotLaunchURL".tr);
              }
            },
          ),
          10.verticalSpace,
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faqsData.length,
              itemBuilder: (context, index) {
                print(faqsData[index].details);
                return Card(
                  child: ExpansionTile(
                    title: CustomText(
                      text: faqsData[index].question,
                      fontSize: 16,
                    ),
                    children: [
                      index == 0
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CustomText(
                                text:
                                    "Ans. Please Contact our Customer Support they will help you to pay for charity.",
                                color: AppColors.darkGrey,
                                fontSize: 16,
                              ),
                            )
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CustomText(
                                text: faqsData[index].details,
                                color: AppColors.darkGrey,
                                fontSize: 16.5,
                              ),
                            ),
                      15.verticalSpace,
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }

  // void _showQrSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) => Container(
  //       width: 100.w,
  //       height: 50.h,
  //       decoration: BoxDecoration(
  //           color: Theme.of(context).colorScheme.background,
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(20),
  //           )),
  //       child: Image.asset(
  //         AppImages.payment_qr,
  //       ),
  //     ),
  //   );
  // }
}

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  final dynamic borderRadius;
  final double? fontSize;
  final IconData? icon;
  final String? image;
  final double? imageSize;
  final Color? iconColor;
  final double? elevation;
  final double? iconSize;
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.backgroundColor,
    required this.onPressed,
    this.borderRadius,
    this.fontSize,
    this.elevation,
    this.icon,
    this.iconColor,
    this.image,
    this.textColor,
    this.imageSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* SizedBox(
              width: 40,
            ), */
            image == null && icon == null
                ? const SizedBox()
                : Column(
                    children: [
                      image == null
                          ? Icon(
                              icon,
                              color: iconColor,
                              size: iconSize,
                            )
                          : image!.contains('svg')
                              ? SvgPicture.asset(image!)
                              : Image.asset(
                                  image!,
                                  scale: imageSize,
                                ),
                    ],
                  ),
            5.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: buttonText,
                  fontSize: fontSize ?? 14.0,
                  color: textColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppStrings {
  // main
  static const String appName = 'MemoNeet';

  // static const String myProgress = 'My Progress';
  // static const String progress = "Progress";
  // home view
  // static const String biology = "Biology";
  // static const String chemistry = "Chemistry";
  // static const String physics = "Physics";
  // static const String offers = 'Offers';
  // static const String contactUs = 'Contact Us';
  // static const String subjects = 'Subjects';
  // static const String questionsLoading = "questions are getting loaded...";

  // chapters view
  static const String practice = "Practice";
  static const String practiceInfoDetailPhy =
      "Our most loved section, where you can practise all the concepts that you have learnt, This section has three categories of Questions EASY, MEDIUM, HARD. Easy meant for boosting your confidence. Medium and Hard to make you NEET ready.";
  static const String practiceInfoDetail = "practiceInfoDetail";
  static const String revision = "Revision";
  static const String notesAndFun = "Notes & Fun";
  static const String notes = "Notes";
  static const String notesAndFunInfoDetail =
      "This section has detailed concept Notes with HD illustration and some Fun learning elements like memes podcast crossword to make your learning retention high.";

  // static const String questions = "questions:";
  // on boarding screen
  static const String biologyPercentage = "100% Biology";
  static const String chemistryPercentage = "96% Chemistry";
  static const String physicsPercentage = "90% Physics";

  // static const String continueString = 'Continue';
  // static const String proceedString = 'Proceed';

  // static const String finish = 'Finish';

  // chapter card
  // static const String topics = "Topics:";
  // topic card & subtopic card
  // static const String subtopics = "Sub topics:";
  // static const String questionCovered = "Question Covered:";

  static const String banner = "ca-app-pub-8233513436328312/1903865801";
  static const String interstitial = "ca-app-pub-8233513436328312/4584239154";

  // custom nav bar
  // static const String home = "Home";
  // static const String plans = "Plans";
  // static const String settings = "Settings";
  // static const String noConnection = 'No Connection';
  // static const String checkConnectivity =
  //     'Please check your internet connectivity';
  // static const String cancel = 'Cancel';
  // static const String ok = 'OK';

  // contact support
  // static const String help = "Help";
  // static String appVersion = Constant.appVersion;

  // static const String forInstantSupport =
  //     "For Instant Support, please download the Telegram App and Join our channel below";
  static const String callTiming = "Call (Timing 10 AM-10 PM)";
  static const String tel = 'tel';
  static const String phoneNumber = "+91 9673045561";

  static const String faqQuestion1 =
      "Q 1. How to pay if i don't have online payments?";
  static const String faqAnswer1 =
      "Ans. You can pay through Paytm, Google Pay, PhonePe, UPI, or any other online payment method. If you still face any issue, you can contact us on the given number.";
  static const String faqQuestion2 =
      "Q 2. How to Switch to Another Mobile after Subscription?";
  static const String faqAnswer2 =
      "Ans. To get the same subscription use the same Login Id(Gmail or Mobile Login) in the New Mobile which you have used previously";
  static const String faqQuestion3 = "Q 3. How do I participate in the events?";
  static const String faqAnswer3 =
      "Ans. We will send a notification anytime there is an even near your location";
  // static const String faqQuestion4 =
  //     "Q 4. How MemoNeet helps to score good marks in NEET Exam?";
  // static const String faqAnswer4 =
  //     "Ans. By using our Revision Algorithm and by Learning all our topics of NCERT you can easily score good marks in Neet Exam!";

  // static const String cannotLaunch = "Cannot launch this url";
  // static const String joinTelegram = "Join telegram channel";
  // static const String sendEmail = "Send an email";
  static const String supportEmail = "dewansh.dev@gmail.com";

// mcqs screen
//   static const String selectAnOption = "Please select an option";
//   static const String enterPositiveNumber = "Please enter a positive number!";
//   static const String enterTheQuestionNumber =
//       'Please Enter the Question Number';
//   static const String gotToQuestionNumber = "Go to Question number";
  static const String mailToText = 'mailto';
  static const String reportEmail = "memoapps.team@gmail.com";
  static const String subjectText = 'subject';
  static const String bodyText = 'body';
  static const String reportText = 'Report';
  static const String userIDText = 'User ID';
  static const String questionIDText = 'Question ID';
  static const String mobileNoText = 'Mobile No';
  static const String versionText = 'Version';

  // static const String gotToTopics = "Go To Topics";
  // static const String next = "Next";
  // static const String nothingHere =
  //     "Oops! It looks\nlike there's\nnothing here";
  // mcq options
  static const String a = 'A';
  static const String b = 'B';
  static const String c = 'C';
  static const String d = 'D';

  // mcqs type
  static const String mcq = "mcq";
  static const String flashCard = "flashcard";
  static const String order = "order";

  // static const String notes = "notes";
  static const String match = "match";
  static const String fillup = "fillup";
  static const String video = "video";
  static const String diagram = "diagram";
  static const String notesCapital = "Notes";
  static const String matchCapital = "Match";
  static const String fillupCapital = "Fillup";
  static const String videoCapital = "Video";
  static const String mcqsCapital = "MCQ's";

  // match
  // static const String tapOnRightOption = "Tap on right options";
  // // subject test screen
  static const String fullLength = "FULL_LENGTH_TEST";
  static const String partTest = "PART_TEST";
  static const String subjectWise = "SUBJECT_WISE";
  static const String unittWise = "UNIT_WISE";
  static const String topicWise = "TOPIC_WISE";

  static const String subjectWiseText = "Subject Wise";
  static const String unittWiseText = "Unit Wise";
  static const String topicWiseText = "Topic Wise";

//practice steps
//   static String readParagraph = "Read Paragraph";
//   static const String selectOption = "Select option";
//   static const String checkOptions = "Check Option";
//   static const String explanation = "Explanation";

  // test series
  // static const String testSeries = "Test Series";
  // static const String results = "Results";
  // static const String fullLengthTestSeries = 'Full Length Test Series';
  // static const String biologyPhysicsChemistry = 'Biology + Physics + Chemistry';
  // static const String contentBaseTestSeries = "Content Based Test Series";
  // static const String remainingTime = "Remaining Time";
  // result type listing
  // static const String biologyResult = "Biology Result";
  // static const String chemistryResult = "Chemistry Result";
  // static const String physicsResult = "Physics Result";

  ///PYQ
  static const String pyqHiveBoxKey = "pyq_attempted_key";

  // TESTSERIES TYPES
  static const String fullLengthTS = "Full Length Test Result";
  static const String partTS = "Part Test Result";
  static const String subjectWiseTS = " Result";
  static const String unitWiseTS = " Unit Result - ";
  static const String topicWiseTS = " Topic Result - ";

  static var ncertSyllabusInstruction =
      "Select Old or New to filter questions base on year 2022 or 2023";

  static var diifcultLevelInstruction =
      "Select default for all levels of questions or\nselect any one or multiple for easy/medium/hard,\nto filter questions based on difficulty level.";

  static var classInstruction =
      "Select Both to filter questions from Class 11 and Class 12 simultaneous or Select any of the class to filter questions based on Particular Class.";

  static var defaultDifInstructionBullet1 =
      "Practice a mix of Easy, Medium, and Hard questions to ensure comprehensive understanding of the NCERT textbook.";

  static var defaultDifInstructionBullet2 =
      "This setting is ideal for building a strong foundation and identifying any knowledge gaps.";

  static var easyDifInstructionBullet1 =
      "Focus on mastering fundamental concepts and essential details.";

  static var easyDifInstructionBullet2 =
      "Easy questions are designed to boost confidence and ensure you haven't missed any basic information.";

  static var mediumDifInstructionBullet1 =
      "Prioritise practicing questions that represent the majority of the NEET exam.";

  static var mediumDifInstructionBullet2 =
      " Mastering Medium-level questions will significantly improve your exam preparedness.";

  static var hardDifInstructionBullet1 =
      "Challenge yourself with tricky and complex questions to prepare for challenging scenarios.";

  static var hardDifInstructionBullet2 =
      "Regularly practicing Hard questions will equip you to handle the toughest situations and achieve your NEET goals.";

  // static var calendlyInfo = "Confused about your NEET exam preparation?";
  static var calendlyInfo =
      "Binge watching YouTube to find the perfect strategy for you?\nAnd nothing seems to work out?";
  static const String calendlyClarity = "Book a free call with our ";
  static const String calendlyClarityHighlighht = "NEET EXPERTS";
  static const String calendlyClarityRemaning = " now !";
  static const String calendlyTeamInfp =
      "Our team is here to assist you. Get in touch with us for quick and reliable solutions by booking a session.";
  static const String calendlyMore = "Know more";
  static const String calendlyBookingBtn = "Book Expert Now !!";
  static const String calendlyNote =
      "Note: Your questions matter and our experts are ready to help. Reach out for a clearer understanding!";

  static const String scheduleTitle = "All in One Brahmastra Test Series";
  static const String hcqTitle =
      "Brahmastra Revision Patrika (Last 30 Days Series)";
  static const String newlyAddedSyllabus = "Newly Added Syllabus";

  static List<String> planOffers = [
    "Biology NCERT line by line Q's".tr,
    "Chemistry NCERT line by line Q's".tr,
    "Physics PYQ based & concept building Q's".tr,
    "Recoreded Physics Lectures",
    "Physics Formulae Section",
    "Physical Chem Formulae Section",
    "Bio,Chem,Phy notes with HD illustrations",
    "Unlimited FULL Length MOCK TEST",
    "Part Test (Select chapters and give full length test)",
    "NCERT page wise DPP filter"
  ];
  static List<String> planMoreOffers = [
    "Biology NCERT line by line Q's".tr,
    "Revision Algorithm",
    "Updated according to nmc syllabus",
    "Chemistry NCERT line by line Q's".tr,
    "Physics PYQ based & concept building Q's".tr,
    "Recoreded Physics Lectures",
    "Physics Formulae Section",
    "Physical Chem Formulae Section",
    "Bio,Chem,Phy notes with HD illustrations",
    "Unlimited FULL Length MOCK TEST",
    "Part Test (Select chapters and give full length test)",
    "NCERT page wise DPP filter"
  ];

  static List<String> brahmastraOffer = [
    "OMR Test experience with built-in OMR Scanner feature to check your OMR sheet",
    "100% NCERT based",
    "14 test available.(4 Part test + 10 full length)",
    "Comes with a test calender plan.",
    "Weightage based on NTA PAPER Analysis",
    "Explanation PDF for each test.",
    "Video Analysis after every test.",
    "Unlimited reattempt available."
  ];

  static List<String> moreInfoTileList = [
    "Over 200+ students achieved a score of 600+ marks".tr,
    "Over 1000+ students achieved a score of 300+ in BIOLOGY".tr,
    "Over 1000+ students achieved a score of 160+ in CHEMISTRY".tr,
    "Over 1000+ students achieved a score of 130+ in PHYSICS".tr,
    "Master NCERT with 300,000+ interactive questions and diagrammatic practice."
        .tr,
    "All years of Previous Year Questions available for Practice",
    "Our I-repeat algorithm offers limitless practice opportunities.".tr,
  ];

  static List<String> scheduleInfoBody = [
    "How do we Select our Questions? We have eagles eye for",
    "✅ Correlated Questions (Questions that involve multiple topic or chapter knowledge to be solved.)",
    "✅ Good number of twisted and indirect questions.",
    "✅ More in text Reasoning Type Questions in Physics.",
    "✅ 1 Numerical from Biology, 1 Graph Based Question in Physics and Chemistry each.",
    "✅ 20% of the question paper will have PYQs or PYQ derived questions."
  ];

  // static List<TroubleshootModel> noquestionFound = [
  //   TroubleshootModel(
  //     stepTitle: "- Choose a different Level",
  //     steps: [
  //       "- Select",
  //       "- Choose a different Level",
  //     ],
  //   ),
  //   TroubleshootModel(
  //     stepTitle: "Update Database in Settings",
  //     steps: [
  //       "- Go to the settings menu",
  //       "- Click on \"Update Database\"",
  //     ],
  //   ),
  //   TroubleshootModel(
  //     stepTitle: "Contact Us",
  //     steps: [
  //       "-If the issue persists, click on👇",
  //     ],
  //   ),
  // ];
}
