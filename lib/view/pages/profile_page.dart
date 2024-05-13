// ignore_for_file: implementation_imports, use_build_context_synchronously, deprecated_member_use

import 'dart:developer';
import 'package:epics_pj/view/pages/contact.dart';
import 'package:epics_pj/view/pages/custom_text.dart';
import 'package:epics_pj/view/pages/faq.dart';
import 'package:epics_pj/view/pages/images.dart';
import 'package:epics_pj/view/pages/my_profile.dart';
import 'package:epics_pj/view/pages/nav.dart';
import 'package:epics_pj/view/pages/refer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:intl/intl.dart';

import 'package:collection/collection.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    super.key,
  });

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

// UserModel? userData;

class _SettingsViewState extends State<SettingsView> {
  late double height;
  // final translationService = Get.find<TranslationService>();
  String lastBackupDateString = "";

  // Future<void> changeThemeDialog(BuildContext context) async {
  //   // context.read<ThemeViewModel>().getTheme();
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return Consumer<ThemeViewModel>(
  //         builder: (context, thmVal, child) {
  //           return AlertDialog(
  //             content: SingleChildScrollView(
  //               child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         CustomText(
  //                           text: "Choose Theme".tr,
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 18.sp,
  //                         ),
  //                         IconButton(
  //                             onPressed: () {
  //                               Navigator.pop(context);
  //                             },
  //                             icon: Icon(
  //                               Icons.close,
  //                               color: Theme.of(context).colorScheme.primary,
  //                             ))
  //                       ],
  //                     ),
  //                     ...context
  //                         .read<ThemeViewModel>()
  //                         .getThemeModel
  //                         .mapIndexed(
  //                           (index, themeModel) => RadioListTile<ThemeData>(
  //                             contentPadding: const EdgeInsets.all(0),
  //                             title: CustomText(text: themeModel.name),
  //                             value: themeModel.theme,
  //                             groupValue: thmVal.appTheme,
  //                             // tileColor: Colors.red,
  //                             onChanged: (value) => thmVal.setTheme(
  //                               theme: value,
  //                               index: index,
  //                               model: themeModel,
  //                               context: context,
  //                             ),
  //                           ),
  //                         )
  //                         .toList(),
  //                   ]),
  //             ),
  //             // actions: <Widget>[
  //             //   TextButton(
  //             //     child: const CustomText(text:'close'),
  //             //     onPressed: () {
  //             //       Navigator.of(context).pop();
  //             //     },
  //             //   ),
  //             // ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // Future<void> changeLanguageDialog(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     // barrierColor: Colors.transparent,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return Obx(() => AlertDialog(
  //             // contentPadding: EdgeInsets.all(5),

  //             content: SingleChildScrollView(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       CustomText(
  //                         text: "chooseLanguage".tr,
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 18.sp,
  //                       ),
  //                       IconButton(
  //                           onPressed: () {
  //                             Navigator.pop(context);
  //                           },
  //                           icon: Icon(
  //                             Icons.close,
  //                             color: Theme.of(context).colorScheme.primary,
  //                           ))
  //                     ],
  //                   ),
  //                   RadioListTile(
  //                     activeColor: Theme.of(context).colorScheme.primary,
  //                     contentPadding: const EdgeInsets.only(left: 1),
  //                     title: CustomText(text: "English"),
  //                     value: "en_US",
  //                     groupValue: translationService.langCode.value,
  //                     onChanged: (value) => _onChangeLang(lang: 'en_US'),
  //                   ),
  //                   RadioListTile(
  //                     contentPadding: const EdgeInsets.only(left: 1),
  //                     activeColor: Theme.of(context).colorScheme.primary,
  //                     title: CustomText(text: "hindi".tr),
  //                     value: "hi_IN",
  //                     groupValue: translationService.langCode.value,
  //                     onChanged: (value) => _onChangeLang(lang: 'hi_IN'),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ));
  //     },
  //   );
  // }

  @override
  void dispose() async {
    super.dispose();
    height = MediaQuery.of(context).size.height;
  }

  intiState() {
    super.initState();
    // context.read<ScheduleTestViewModel>().fetchSchedule(context);
    // if (context.read<AuthViewModel>().isGuestUser!) {
    //   null;
    // } else if (context.read<UserViewModel>().userModel?.firstName == null) {
    //   context.read<UserViewModel>().getUserInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    // var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    // var shortestSide = MediaQuery.of(context).size.shortestSide;

    return WillPopScope(
      onWillPop: () async {
        // Navigate to the home page when back button is pressed
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true; // Return true to allow popping
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
            title: CustomText(
              text: "settings",
              fontWeight: FontWeight.w600,
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                        color: AppColors.clueCoinBackgroundColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(AppImages.memoCoin,
                              allowDrawingOutsideViewBox: true,
                              width: 25,
                              height: 25),
                          CustomText(
                            text: '0',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          2.horizontalSpace
                        ])),
              )
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                // CircleAvatar(
                                //   radius:
                                //       MediaQuery.of(context).size.shortestSide < 600
                                //           ? 25
                                //           : 35,
                                //   child: CustomText(
                                //     text: authViewModel.isGuestUser == false
                                //         ? context
                                //                 .read<UserViewModel>()
                                //                 .userModel
                                //                 ?.firstName![0]
                                //                 .toUpperCase() ??
                                //             "G"
                                //         : "G",
                                //     fontSize: 20.sp,
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                                // 16.horizontalSpace,
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: "Dewansh",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          height: 1.5,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: "Batch: B1",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            // CustomText(
                                            //   text: authViewModel
                                            //               .isGuestUser ==
                                            //           false
                                            //       ? "${context.watch<UserViewModel>().userModel?.batch}"
                                            //       : "",
                                            //   fontSize: 15.sp,
                                            //   color: Colors.grey,
                                            //   fontWeight: FontWeight.w600,
                                            // ),
                                          ],
                                        )
                                        //  InkWell(
                                        //     borderRadius:
                                        //         BorderRadius.circular(15),
                                        //     onTap: () async {
                                        //       UIBlock.block(
                                        //         context,
                                        //         loadingTextWidget: CustomText(
                                        //             fontWeight:
                                        //                 FontWeight.w600,
                                        //             text: "loggingOut".tr),
                                        //         childBuilder: (context) =>
                                        //             const Loader(),
                                        //       );
                                        //       if (!Hive.isBoxOpen(
                                        //           HiveBoxName.userBox)) {
                                        //         await Hive.openBox(
                                        //             HiveBoxName.userBox);
                                        //       }
                                        //       // await context
                                        //       //     .read<RevisionService>()
                                        //       //     .backupRevision3(context);
                                        //       context
                                        //           .read<AuthViewModel>()
                                        //           .logout(context)
                                        //           .then((value) {
                                        //         if (value == true) {
                                        //           context
                                        //               .read<UserViewModel>()
                                        //               .reset();
                                        //           if (!Hive.isBoxOpen(
                                        //               HiveBoxName.userBox)) {
                                        //             Hive.box(HiveBoxName
                                        //                     .userBox)
                                        //                 .delete('user');
                                        //           }
                                        //           UIBlock.unblock(context);
                                        //           // Provider.of<NavigationViewModel>(
                                        //           //         context,
                                        //           //         listen: false)
                                        //           //     .changePage(0);
                                        //           Navigator
                                        //               .pushNamedAndRemoveUntil(
                                        //                   context,
                                        //                   LoginScreen.route,
                                        //                   (route) =>
                                        //                       false).then(
                                        //               (value) {
                                        //             authViewModel.userModel =
                                        //                 null;
                                        //           });
                                        //         }
                                        //       });
                                        //     },
                                        //     child: Container(
                                        //       width: shortestSide < 600
                                        //           ? 80
                                        //           : 120,
                                        //       height: shortestSide < 600
                                        //           ? 40
                                        //           : 60,
                                        //       padding:
                                        //           const EdgeInsets.symmetric(
                                        //               vertical: 5,
                                        //               horizontal: 10),
                                        //       decoration: BoxDecoration(
                                        //         color: Theme.of(context)
                                        //             .colorScheme
                                        //             .primary,
                                        //         borderRadius:
                                        //             BorderRadius.circular(5),
                                        //         boxShadow: [
                                        //           BoxShadow(
                                        //             color: AppColors
                                        //                 .primaryColor2,
                                        //             // spreadRadius: 1,
                                        //             // blurRadius: 1,
                                        //             offset:
                                        //                 const Offset(0, 5),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       child: Center(
                                        //         child: CustomText(
                                        //           text: "Login",
                                        //           color: AppColors.white,
                                        //           fontSize: 18.sp,
                                        //           fontWeight: FontWeight.w600,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const Divider(),
                        5.verticalSpace,
                        SettingsHeading(text: "General"),
                        10.verticalSpace,

                        SettingsCard(
                          index: 1,
                          title: "My Profile",
                          image: AppImages.profileIcon,
                          onTap: () {
                            PageNavigator(ctx: context)
                                .nextPage(page: const MyProfile())
                                .then((value) {
                              setState(() {});
                            });
                          },
                        ),
                        // Provider.of<AuthViewModel>(context, listen: false)
                        //             .isGuestUser !=
                        //         true
                        //     ? 10.verticalSpace
                        //     : const SizedBox(),

                        // Provider.of<AuthViewModel>(context, listen: false)
                        //             .isGuestUser !=
                        //         true
                        //     ? SettingsCard(
                        //         index: 2,
                        //         title: "Backup".tr,
                        //         icon: Icons.backup,
                        //         onTap: () async {
                        //           try {
                        //             // final revision  = await Hive.openBox<RevisionListModel>(
                        //             //   HiveBoxName.revisionQuestionsBoxName,
                        //             // );
                        //             // revision.clear();
                        //             // final questionsBox =
                        //             // await Hive.openBox<QuestionListModel>(HiveBoxName.questionsBoxName);
                        //             // questionsBox.clear();
                        //             await context
                        //                 .read<RevisionService>()
                        //                 .backupRevision3(context);
                        //             //
                        //             // await context
                        //             //     .read<QuestionsServices>()
                        //             //     .backupBookmarkQuestions();
                        //             showSnackBar(
                        //                 context: context,
                        //                 message: "backupSuccessful".tr);
                        //           } catch (e) {
                        //             log(e.toString());
                        //           }
                        //         },
                        //       )
                        //     : SizedBox(),
                        // Provider.of<AuthViewModel>(context, listen: false)
                        //             .isGuestUser !=
                        //         true
                        //     ? 10.verticalSpace
                        //     : SizedBox(),
                        // Provider.of<AuthViewModel>(context, listen: false)
                        //             .isGuestUser !=
                        //         true
                        //     ? SettingsCard(
                        //         index: 3,
                        //         title: "Restore".tr,
                        //         icon: Icons.restore,
                        //         onTap: () async {
                        //           try {
                        //             log("clicked: restore");
                        //             await context
                        //                 .read<RevisionService>()
                        //                 .restoreRevisionData();
                        //             // await context
                        //             //     .read<QuestionsServices>()
                        //             //     .restoreBookmarkQuestions();
                        //             showSnackBar(
                        //                 context: context,
                        //                 message: "restoresuccessful".tr);
                        //           } catch (e) {
                        //             showSnackBar(
                        //                 context: context, message: e.toString());
                        //           }
                        //         },
                        //       )
                        //     : const SizedBox(),

                        10.verticalSpace,
                        // SettingsCard(
                        //   title: "Bookmarks",
                        //   icon: Icons.bookmarks_outlined,
                        //   onTap: () {},
                        // ),

                        // 10.verticalSpace,

                        // SettingsCard(
                        //   title: "How to use",
                        //   // icon: Icons.info_outline,
                        //   image: "assets/images/how_to_use.svg",
                        //   onTap: () {},
                        // ),
                        // SettingsCard(
                        //   index: 4,
                        //   title: "updateDatabase".tr,
                        //   icon: Icons.cloud_outlined,
                        //   onTap: () async {
                        //     showSnackBar(
                        //         context: context,
                        //         message: "updatingQuestions".tr);
                        //     await SqliteDatabase().resetDatabases();
                        //     context
                        //         .read<SubjectViewModel>()
                        //         .loadQuestions(context);
                        //   },
                        // ),

                        10.verticalSpace,
                        SettingsHeading(text: "Advanced"),

                        SettingsCard(
                          index: 2,
                          title: "Restore And Backup",
                          image: AppImages.restore_and_backup_icon,
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const RestoreBackupPage(),
                            //     ));
                          },
                        ),

                        // 10.verticalSpace,
                        // SettingsCard(
                        //   title: "Refer & Earn",
                        //   image: AppImages.refer_and_earn,
                        //   onTap: () {},
                        // ),
                        10.verticalSpace,
                        // SettingsCard(
                        //   index: 6,
                        //   title: "Themes".tr,
                        //   image: AppImages.themeIcon,
                        //   onTap: () => changeThemeDialog(context),
                        // ),
                        // 10.verticalSpace,

                        ///Language change
                        // SettingsCard(
                        //   index: 7,
                        //   title: "language".tr,
                        //   icon: Icons.language,
                        //   onTap: () {
                        //     changeLanguageDialog(context);
                        //     // final translationService = Get.find<TranslationService>();
                        //     // translationService.changeLocale(languageCode: "hi_IN");
                        //   },
                        // ),
                        // 10.verticalSpace,

                        SettingsCard(
                          index: 5,
                          title: "Refer And Earn",
                          image: AppImages.user_plus,
                          onTap: () async {
                            PageNavigator(ctx: context)
                                .nextPage(page: const ReferAndEarnView());
                          },
                        ),
                        // : const SizedBox(),
                        10.verticalSpace,

                        SettingsHeading(text: "Help"),
                        10.verticalSpace,

                        SettingsCard(
                          index: 8,
                          title: "Faqs",
                          image: AppImages.faqsIcon,
                          onTap: () {
                            PageNavigator(ctx: context)
                                .nextPage(page: const FaQsView());
                          },
                        ),
                        10.verticalSpace,
                        SettingsCard(
                          index: 9,
                          title: "ContactSupport",
                          image: AppImages.contact_support,
                          onTap: () {
                            PageNavigator(ctx: context)
                                .nextPage(page: const ContactSupport());
                          },
                        ),
                        10.verticalSpace,

                        // 10.verticalSpace,
                        // authViewModel.isGuestUser!
                        //     ? const SizedBox()
                        //     : SettingsCard(
                        //         index: 11,
                        //         title: "deleteAccount".tr,
                        //         icon: Icons.delete,
                        //         onTap: () async {
                        //           if (!Hive.isBoxOpen(HiveBoxName.userBox)) {
                        //             await Hive.openBox(HiveBoxName.userBox);
                        //           }
                        //           dialogForDeleteAccount(
                        //             context: context,
                        //             onPressedYes: () async {
                        //               UIBlock.block(
                        //                 context,
                        //                 loadingTextWidget:
                        //                     CustomText(text: "loggingOut".tr),
                        //                 childBuilder: (context) => const Loader(),
                        //               );
                        //               await context
                        //                   .read<AuthViewModel>()
                        //                   .logout(context)
                        //                   .then((value) async {
                        //                 if (value == true) {
                        //                   try {
                        //                     await Hive.box<UserModel>(
                        //                             HiveBoxName.userBox)
                        //                         .delete('user');
                        //                     context.read<UserViewModel>().reset();

                        //                     UIBlock.unblock(context);
                        //                     // Provider.of<NavigationViewModel>(
                        //                     //         context,
                        //                     //         listen: false)
                        //                     //     .changePage(0);
                        //                     Navigator.pushNamedAndRemoveUntil(
                        //                         context,
                        //                         LoginScreen.route,
                        //                         (route) => false).then((value) {
                        //                       authViewModel.userModel = null;
                        //                     });
                        //                   } catch (e) {
                        //                     log(e.toString());
                        //                   }
                        //                 }
                        //               });
                        //             },
                        //           );
                        //         },
                        //       ),

                        // SettingsCard(
                        //   index: 9,
                        //   title: "Cancellation",
                        //   icon: Icons.cancel_outlined,
                        //   onTap: () {
                        //     // PageNavigator(ctx: context)
                        //     //     .nextPage(page: const ContactSupport());
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        23.verticalSpace,
                        CustomText(
                          text: "Follow Us On",
                          fontSize:
                              MediaQuery.of(context).size.shortestSide < 600
                                  ? 14.0
                                  : 18.0,
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialIcon(
                              imageUrl: AppImages.telegram_logo,
                              url: AppUrls.telegramUrl,
                            ),
                            20.horizontalSpace,
                            SocialIcon(
                              imageUrl: AppImages.youtube_logo,
                              url: AppUrls.youtubeUrl,
                            ),
                            20.horizontalSpace,
                            SocialIcon(
                              imageUrl: AppImages.instagram_logo,
                              url: AppUrls.instaUrl,
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        CustomText(
                          text: "Version 1.0.0",
                          color: AppColors.darkGrey,
                          fontSize:
                              MediaQuery.of(context).size.shortestSide < 600
                                  ? 14.0
                                  : 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  // launchUrl(
                                  //     Uri.parse(Constant.termsAndConditionsUrl));
                                },
                                child: CustomText(
                                    text: "Tnc",
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide <
                                            600
                                        ? 12.0
                                        : 16.0)),
                            CustomText(
                              text: " | ",
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                            TextButton(
                                onPressed: () {
                                  // launchUrl(Uri.parse(Constant.privicyPolicyUrl));
                                },
                                child: CustomText(
                                    text: "${"Privacy Policy"}   ",
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: MediaQuery.of(context)
                                                .size
                                                .shortestSide <
                                            600
                                        ? 12.0
                                        : 16.0)),
                          ],
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () async {
                            // await launchUrl(
                            //     Uri.parse(Constant.cancellationAndRefundURL));
                          },
                          child: CustomText(
                              text: "Cancellation And Refund",
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.shortestSide < 600
                                      ? 12.0
                                      : 16.0),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension WidgetSpacing on int {
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
  SizedBox get verticalSpace => SizedBox(height: toDouble());
}

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static Color logoName = const Color(0xff5E17EB);
  static Color transparent = const Color(0x00000000);
  static Color white = const Color(0xffFFFFFF);
  static Color black = const Color(0xff000000);
  static Color red = const Color(0xffB22222);
  static Color redWrongBottomSheetShadow = const Color(0xffFF847E);
  static Color redWrongBottomSheetBG = const Color(0xffF9E0E0);
  static Color redWrongButtonColor = const Color(0xffFF4D45);
  static Color redDiscountOff = const Color(0xffFF4D45);
  static Color redWrongButtonColorShadow = const Color(0xffFF847E);
  static Color greenCorrectBottomSheetShadow = const Color(0xff2CC62A);
  static Color greenCorrectBottomSheetBG = const Color(0xffDFFEBF);
  static Color greenPlanCardBG = const Color(0xffDFFEBF);
  static Color greenPlanCardIncludeDarkBG = const Color(0x6677DD76);
  static Color greenDarkPlanCardBG = const Color(0xff2CC62A);
  static Color greenDarkPlanCardContentBG = const Color(0xff049303);
  static Color greenCorrectButtonColor = const Color(0xff2CC62A);
  static Color greenCorrectButtonColorShadow = const Color(0xff77DD76);

  static Color darkRed = const Color(0xffDB3737);
  static Color themePink = const Color(0xffFFCBCB);
  static Color lightPink = const Color(0xffFF9279);
  static Color pink = Colors.pink;
  static Color pink2 = const Color(0xffe2533d);
  static Color barsPink = const Color(0xffFF9BCC);

  static Color themeColor = const Color(0xff191970);
  static Color primaryColor = const Color(0xff4dc2f8);
  static Color primaryDarkColor = const Color(0xff235A9F);
  static Color primaryDarkColor2 = const Color(0xff1B375C);
  static Color clueCoinBackgroundColor = const Color.fromRGBO(35, 90, 159, 1);

  static Color buttonBlue = const Color(0xff16379A);
  static Color textBlue = const Color(0xff8681FC);
  static Color blue = const Color(0xff574FFA);
  static Color lightBlue = const Color(0xff9CC1FA);
  static Color brandBlue = const Color(0xff2FAAE2);
  static Color progressColor = const Color(0xff4DC2F8);
  static Color bgCardBlue = const Color(0xffEDF9FE);
  static Color darkThemeCard = const Color(0xff37383F);
  static Color darkBlue = const Color(0xff19182B);
  static Color blueGrey = const Color(0xff48466E);
  static Color lightGrey = const Color(0xffEEEEEF);
  static Color bgBlue = const Color(0xff9B96E8);
  static Color textGrey = const Color(0xffB9B8C8);
  static Color darkText = const Color(0xff1C1C34);
  static Color grey = const Color(0xffCFCED9);
  static Color bgGrey = const Color(0xffE1E0DE);
  static Color darkGrey = const Color(0xff707070);
  static Color bgLightGrey = const Color(0xffF6F7F6);
  static Color yellowishGrey = const Color(0xffC4C5B6);
  static Color headingColor = const Color.fromRGBO(26, 17, 45, 0.8);
  // Color hintTextColor = const Color(0xff514AFB);
  static Color controlsBg = const Color(0xffDEDDDB);
  static Color controlsBg2 = const Color(0xffBFC5C8);
  static Color volumeBg = const Color(0xffCFD4D7);
  static Color lightGreen = const Color(0xff80FF80);
  static Color mediumGreen = const Color(0xff32cd32);
  static Color mediumGreen2 = const Color(0xff2CC62A);
  static Color darkGreen = const Color(0xff228b22);
  static Color textBlack = const Color(0xff19182A);
  static Color shadowColor = const Color(0xffA7A6B6);
  static Color fieldFillColor = const Color(0xffF7F8FC);
  static Color fieldBorderColor = const Color(0xffECECEC);
  static Color primaryColor2 = const Color(0xff2FAAE2);
  static Color bio = const Color.fromRGBO(132, 198, 50, 1);
  static Color chem = const Color.fromRGBO(142, 117, 226, 1);
  static Color phy = const Color.fromRGBO(240, 170, 27, 1);
  static Color yellowMCQ = const Color(0xFFFFFDCB);
  static Color yellowMCQShadow = const Color(0xFFFFD063);
  static Color onBoardingLightGreen = const Color(0xffDFFEBF);
  static Color onBoardingDarkGreen = const Color(0xff2CC62A);
  static Color darkCustomTileBorder = const Color(0xff235A9F);
  static Color plansBorderWhiteAndroid = const Color(0xFFEEEEEF);
  static Color plansBorderGreenAndroid = const Color(0xff2CC62A);
  static Color plansBoxShadowWhiteAndroid = const Color(0x19000000);
  static Color plansContentBackgroundBlackAndroid = const Color(0xFF373A3D);
  static Color plansContentBackgroundGreenAndroid = const Color(0xff2CC62A);
  static Color questionNavigatorGreen = const Color(0xFF2CC62A);
  static Color questionNavigatorRed = const Color(0xFFFF4D45);
  static Color questionNavigatorYellow = const Color(0xFFFFB712);

  static const lightPureColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF4dc2f8),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFC3E8FF),
    onPrimaryContainer: Color(0xFF001E2C),
    secondary: Color(0xFF00696F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF76F5FF),
    onSecondaryContainer: Color(0xFF002022),
    tertiary: Color(0xFF605A7D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE6DEFF),
    onTertiaryContainer: Color(0xFF1C1736),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFCFE),
    onBackground: Color(0xFF191C1E),
    surface: Color(0xFFFBFCFE),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDCE3E9),
    onSurfaceVariant: Color(0xFF41484D),
    outline: Color(0xFF71787D),
    onInverseSurface: Color(0xFFF0F1F3),
    inverseSurface: Color(0xFF2E3133),
    inversePrimary: Color(0xFF78D1FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006689),
    outlineVariant: Color(0xFFC0C7CD),
    scrim: Color(0xFF000000),
  );

  static const darkPureColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF78D1FF),
    onPrimary: Color(0xFF003549),
    primaryContainer: Color(0xFF004C68),
    onPrimaryContainer: Color(0xFFC3E8FF),
    secondary: Color(0xFF4CD9E3),
    onSecondary: Color(0xFF00363A),
    secondaryContainer: Color(0xFF004F54),
    onSecondaryContainer: Color(0xFF76F5FF),
    tertiary: Color(0xFFC9C1EA),
    onTertiary: Color(0xFF312C4C),
    tertiaryContainer: Color(0xFF484264),
    onTertiaryContainer: Color(0xFFE6DEFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1E),
    onBackground: Color(0xFFE1E2E5),
    surface: Color(0xFF2A3033),
    onSurface: Color(0xFFE1E2E5),
    surfaceVariant: Color(0xFF41484D),
    onSurfaceVariant: Color(0xFFC0C7CD),
    outline: Color(0xFF8A9297),
    onInverseSurface: Color(0xFF191C1E),
    inverseSurface: Color(0xFFE1E2E5),
    inversePrimary: Color(0xFF006689),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF78D1FF),
    outlineVariant: Color(0xFF41484D),
    scrim: Color(0xFF000000),
  );
}

class AppUrls {
  static const String noImage =
      'https://secure.gravatar.com/avatar/15f8001624bd5b624aa2c00d0d25b1f4?s=168&d=mm&r=g';
  // static const String biologySpreadsheet =
  //     "https://docs.google.com/spreadsheets/u/0/d/1zqjhxOz7oGpGLI3YfgWfK5dqtksQJKVOqRCABzkt4AQ/htmlview";
  // static const String chemistrySpreadsheet =
  //     "https://docs.google.com/spreadsheets/u/0/d/1-ig8929o8W-Jl7pfJ4jzwIWjC2cqkQn06QYN_vRREf4/htmlview";
  static const String showProofLink =
      "https://lookerstudio.google.com/u/0/reporting/61ad792d-4b09-43e7-bed7-3fe45a683401/page/AP0QD";
  static const String youtubeVideoPlayUrl = "https://youtu.be/";

  static const String instaUrl = 'https://www.instagram.com/memoneet_ncert/';
  static const String youtubeUrl = 'https://www.youtube.com/c/MemoNeetTeam';
  static const String telegramUrl = 'https://t.me/neet_ncert_quiz';
  static const String contactUrl = 'https://www.memoneet.com/contact';
  static const String whatsappUrl =
      'https://chat.whatsapp.com/group/KAtzzeKxcYm511TH8WoUyF';
  static String baseUrl = '';
}

class SettingsHeading extends StatelessWidget {
  final String text;
  const SettingsHeading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 5,
          ),
          child: CustomText(
            text: text,
            fontWeight: FontWeight.w600,
            fontSize: 15.5,
          ),
        ),
      ],
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final String? image;
  final VoidCallback onTap;
  final int index;
  const SettingsCard({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
    required this.index,
    this.image,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        // color: const Color(0xffEEF9FF),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          // border: Border.all(
          //   // color: AppColors.bgGrey,
          //   // width: 2,
          // ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.shortestSide < 600 ? 15 : 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onLongPress: () {
                        // context.read<UserViewModel>().addIndex(index, context);
                      },
                      child: image == null
                          ? Icon(
                              icon,
                              // color: const Color(0xff4DC2F8),
                              color: Colors.black,

                              size: 22,
                            )
                          : SvgPicture.asset(
                              image!,
                              height: 22,
                              allowDrawingOutsideViewBox: true,
                              color: iconColor,
                            ),
                    ),
                    10.horizontalSpace,
                    CustomText(
                      text: title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

class SocialIcon extends StatelessWidget {
  final String imageUrl;
  final String url;

  const SocialIcon({
    super.key,
    required this.url,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(
            url,
            universalLinksOnly: true,
          );
        } else {
          throw 'There was a problem to open the url: $url';
        }
      },
      child: Image.asset(
        imageUrl,
        height: 30,
        width: 30,
      ),
    );
  }
}
