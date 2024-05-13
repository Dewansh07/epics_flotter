// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:epics_pj/view/pages/custom_text.dart';
import 'package:epics_pj/view/pages/profile_page.dart';
import 'package:epics_pj/view/pages/refer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// ts/text/custom_text.dart';
import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

class MyProfile extends StatefulWidget {
  static const String route = "/my-profile";

  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String dropdownValue = "Exam Type";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  var statedropdownValue;
  var batchdropdownValue;

  // var isRepeaterValue;

  var formKey = GlobalKey<FormState>();
  // late UserViewModel userViewModel;

  @override
  void initState() {
    // userViewModel = context.read<UserViewModel>();
    firstNameController.text = "Dewansh";
    lastNameController.text = "21BCE10987";
    emailController.text = "dewansh@gmail.com";
    phoneController.text = "8595713216";
    // parentPhoneController.text =
    //     userViewModel.userModel?.parentMobileNumber ?? "";
    // batchdropdownValue = userViewModel.userModel?.batch;
    statedropdownValue = "Delhi";
    // firstNameController.text =
    //     "${userViewModel.userModel?.firstName ?? "Dewansh"}";
    // lastNameController.text = userViewModel.userModel?.lastName ?? "Wadhwa";
    // emailController.text = userViewModel.userModel?.emailId ?? "dev@gmail.com";
    // phoneController.text =
    //     userViewModel.userModel?.mobileNumber ?? "8595713216";
    // // parentPhoneController.text =
    // //     userViewModel.userModel?.parentMobileNumber ?? "";
    // // batchdropdownValue = userViewModel.userModel?.batch;
    // statedropdownValue = userViewModel.userModel?.state ?? "Karnataka";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.sizeOf(context).shortestSide;
    // var baseViewModel = Provider.of<BaseViewModel>(context, listen: false);
    // var userVMprovider = Provider.of<UserViewModel>(context);

// Formatting the valid till datetime using DateFormat

    // isRepeaterValue = userVMprovider.userModel?.isRepeater;
    // Constant.prefs.getString(SharedPrefsHelper.isRepeater) != null
    //     ? userVMprovider.isRepeaterValue = Constant.prefs.getString(SharedPrefsHelper.isRepeater)
    //     : '';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: ReusableWidgets.myAppBarWithLeading(
        onLeadingPress: () => Navigator.pop(context, true),
        context: context,
        title: "myProfile".tr,
      ),
      bottomNavigationBar: SafeArea(
        child: GlobalCustomTile(
          margin: shortestSide < 600
              ? const EdgeInsets.only(left: 10, bottom: 25, right: 10, top: 10)
              : EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.25,
                  vertical: 10),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
          boxShadowColor: AppColors.primaryColor2,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () async {
              // if (formKey.currentState!.validate()) {
              //   if (phoneController.text.length == 10) {
              //     setState(() {
              //       userViewModel.userModel!.firstName =
              //           firstNameController.text;
              //       // context.read<UserViewModel>().userModel?.firstName = firstNameController.text;
              //       userViewModel.userModel!.lastName = lastNameController.text;
              //       // context.read<UserViewModel>().userModel?.lastName = lastNameController.text;
              //       userViewModel.userModel!.emailId = emailController.text;
              //       userViewModel.userModel!.mobileNumber =
              //           phoneController.text;
              //       // userViewModel.userModel!.parentMobileNumber =
              //       //     parentPhoneController.text;

              //       // userViewModel.userModel!.batch = batchdropdownValue;
              //       // context.read<UserViewModel>().userModel?.batch =
              //       //     batchdropdownValue;
              //       // userViewModel.userModel!.state = statedropdownValue;
              //       // userVMprovider.userModel!.isRepeater =
              //       //     userVMprovider.isRepeaterValue;
              //       // userViewModel.userModel!.paymentDetails =
              //           // context.read<UserViewModel>().userModel?.paymentDetails;
              //     });

              //     await userViewModel.updateUserInfo();
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         margin: const EdgeInsets.symmetric(horizontal: 100),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(200.0),
              //         ),
              //         content: Text(
              //           "Profile Updated Successfully".tr,
              //         ),
              //         duration: const Duration(milliseconds: 1000),
              //       ),
              //     );

              //     // Constant.prefs.setString(SharedPrefsHelper.isRepeater,
              //     //     userVMprovider.isRepeaterValue ?? "No");
              //   } else {
              //     showSnackBar(
              //         context: context, message: 'Phone number is not correct');
              //   }
              // }
            },
            child: CustomText(
              text: "Update".tr,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  20.verticalSpace,
                  ProfileTextField(
                    hintText: "firstName".tr,
                    controller: firstNameController,
                  ),

                  20.verticalSpace,

                  ProfileTextField(
                    hintText: "lastName".tr,
                    controller: lastNameController,
                  ),

                  20.verticalSpace,

                  ProfileTextField(
                    controller: emailController,
                    hintText: "email".tr,
                  ),
                  20.verticalSpace,

                  ProfileTextField(
                    controller: phoneController,
                    hintText: 'phoneNumber'.tr,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    enabled: phoneController.text.trim().length < 10,
                  ),
                  20.verticalSpace,

                  // ProfileTextField(
                  //   controller: parentPhoneController,
                  //   keyboardType: TextInputType.phone,
                  //   hintText: 'parentPhoneNumber'.tr,
                  //   maxLength: 10,
                  // ),
                  // 20.verticalSpace,

                  // DropdownButtonFormField<String>(
                  //   dropdownColor: Theme.of(context).colorScheme.surface,
                  //   value: batchdropdownValue,
                  //   borderRadius: BorderRadius.circular(15),
                  //   decoration: InputDecoration(
                  //     labelText: "selectBatch".tr,
                  //     hintStyle: const TextStyle(fontSize: 13),
                  //     contentPadding: EdgeInsets.symmetric(
                  //         horizontal: shortestSide < 600 ? 5 : 10,
                  //         vertical: shortestSide < 600 ? 10 : 20),
                  //     hintText: batchdropdownValue == null
                  //         ? "selectBatch".tr
                  //         : baseViewModel.batchList.first,
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15)),
                  //     // border: const UnderlineInputBorder(
                  //     //   // Use UnderlineInputBorder for bottom border
                  //     //   borderSide: BorderSide(
                  //     //
                  //     //     color: Color.fromRGBO(94, 24, 234, 0.2), // Set the color of the bottom border
                  //     //     width: 2, // Set the width of the bottom border
                  //     //   ),
                  //     // ),
                  //   ),
                  //   items: baseViewModel.batchList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: CustomText(
                  //         text: value,
                  //         fontSize: 15.sp,
                  //       ),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     batchdropdownValue = newValue;
                  //   },
                  // ),
                  // 20.verticalSpace,

                  DropdownButtonFormField<String>(
                    dropdownColor: Theme.of(context).colorScheme.surface,
                    value: statedropdownValue,
                    borderRadius: BorderRadius.circular(15),
                    decoration: InputDecoration(
                      labelText: "selectState".tr,
                      hintStyle: const TextStyle(fontSize: 13),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: shortestSide < 600 ? 5 : 10,
                          vertical: shortestSide < 600 ? 10 : 20),
                      hintText:
                          statedropdownValue == null ? "selectState".tr : '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // border: const UnderlineInputBorder(
                      //   // Use UnderlineInputBorder for bottom border
                      //   borderSide: BorderSide(
                      //     color: Color.fromRGBO(94, 24, 234, 0.2), // Set the color of the bottom border
                      //     width: 2, // Set the width of the bottom border
                      //   ),
                      // ),
                    ),
                    items: <String>[
                      'Delhi',
                      'Karnataka',
                      'Maharashtra',
                      'Uttar Pradesh',
                      'Tamil Nadu',
                      'Gujarat',
                      'West Bengal',
                      'Rajasthan',
                      'Andhra Pradesh',
                      'Kerala',
                      'Madhya Pradesh',
                      'Telangana',
                      'Bihar',
                      'Haryana',
                      'Punjab',
                      'Odisha',
                      'Assam',
                      'Jharkhand',
                      'Chhattisgarh',
                      'Uttarakhand',
                      'Himachal Pradesh',
                      'Jammu and Kashmir',
                      'Goa',
                      'Tripura',
                      'Manipur',
                      'Meghalaya',
                      'Nagaland',
                      'Arunachal Pradesh',
                      'Sikkim',
                      'Mizoram',
                      'Andaman and Nicobar',
                      'Puducherry',
                      'Chandigarh',
                      'Dadra and Nagar Haveli',
                      'Daman and Diu',
                      'Lakshadweep'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: CustomText(
                          text: value,
                          fontSize: 15,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      statedropdownValue = newValue;
                    },
                  ),
                  20.verticalSpace,

                  // Stack(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(15),
                  //           border: Border.all(color: AppColors.textGrey),
                  //         ),
                  //         padding: EdgeInsets.symmetric(
                  //             vertical: shortestSide < 600 ? 10 : 20),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Expanded(
                  //               child: InkWell(
                  //                 borderRadius: BorderRadius.circular(15),
                  //                 onTap: () {
                  //                   userVMprovider.isRepeaterValue = "Yes";
                  //                   userVMprovider.changeRepeaterValue(
                  //                       userVMprovider.isRepeaterValue);
                  //                 },
                  //                 child: userVMprovider.repeaterStatus == true
                  //                     ? GlobalCustomTile(
                  //                         margin: shortestSide < 600
                  //                             ? EdgeInsets.symmetric(
                  //                                 horizontal:
                  //                                     MediaQuery.sizeOf(context)
                  //                                             .width *
                  //                                         0.07,
                  //                                 vertical: 0)
                  //                             : EdgeInsets.symmetric(
                  //                                 horizontal:
                  //                                     MediaQuery.sizeOf(context)
                  //                                             .width *
                  //                                         0.15,
                  //                                 vertical: 0),
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 10, horizontal: 10),
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                         boxShadowColor:
                  //                             AppColors.primaryColor2,
                  //                         color: Theme.of(context)
                  //                             .colorScheme
                  //                             .primary,
                  //                         child: CustomText(
                  //                           text: "yes".tr,
                  //                           color:
                  //                               userVMprovider.repeaterStatus ==
                  //                                       true
                  //                                   ? AppColors.white
                  //                                   : isDarkMode(context)
                  //                                       ? Colors.white
                  //                                       : AppColors.black,
                  //                           textAlign: TextAlign.center,
                  //                         ),
                  //                       )
                  //                     : Container(
                  //                         margin: EdgeInsets.symmetric(
                  //                             horizontal:
                  //                                 MediaQuery.sizeOf(context)
                  //                                         .width *
                  //                                     0.07,
                  //                             vertical: 0),
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 10, horizontal: 10),
                  //                         child: CustomText(
                  //                           text: "yes".tr,
                  //                           color:
                  //                               userVMprovider.repeaterStatus ==
                  //                                       true
                  //                                   ? AppColors.white
                  //                                   : isDarkMode(context)
                  //                                       ? Colors.white
                  //                                       : AppColors.black,
                  //                           textAlign: TextAlign.center,
                  //                         ),
                  //                       ),
                  //               ),
                  //             ),
                  //             Expanded(
                  //               child: InkWell(
                  //                 borderRadius: BorderRadius.circular(15),
                  //                 onTap: () {
                  //                   userVMprovider.isRepeaterValue = "No";
                  //                   userVMprovider.changeRepeaterValue(
                  //                       userVMprovider.isRepeaterValue);
                  //                 },
                  //                 child: userVMprovider.repeaterStatus == false
                  //                     ? GlobalCustomTile(
                  //                         margin: shortestSide < 600
                  //                             ? EdgeInsets.symmetric(
                  //                                 horizontal:
                  //                                     MediaQuery.sizeOf(context)
                  //                                             .width *
                  //                                         0.07,
                  //                                 vertical: 0)
                  //                             : EdgeInsets.symmetric(
                  //                                 horizontal:
                  //                                     MediaQuery.sizeOf(context)
                  //                                             .width *
                  //                                         0.15,
                  //                                 vertical: 0),
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 10, horizontal: 10),
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                         boxShadowColor:
                  //                             AppColors.primaryColor2,
                  //                         color: Theme.of(context)
                  //                             .colorScheme
                  //                             .primary,
                  //                         child: CustomText(
                  //                           text: "no".tr,
                  //                           color:
                  //                               userVMprovider.repeaterStatus ==
                  //                                       false
                  //                                   ? AppColors.white
                  //                                   : isDarkMode(context)
                  //                                       ? Colors.white
                  //                                       : AppColors.black,
                  //                           textAlign: TextAlign.center,
                  //                         ),
                  //                       )
                  //                     : Container(
                  //                         margin: EdgeInsets.symmetric(
                  //                             horizontal:
                  //                                 MediaQuery.sizeOf(context)
                  //                                         .width *
                  //                                     0.07,
                  //                             vertical: 0),
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 10, horizontal: 10),
                  //                         child: CustomText(
                  //                           text: "no".tr,
                  //                           textAlign: TextAlign.center,
                  //                         ),
                  //                       ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Positioned(
                  //       left: 12,
                  //       top: 1,
                  //       child: Container(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 8,
                  //         ),
                  //         color: isDarkMode(context)
                  //             ? Colors.black
                  //             : AppColors.white,
                  //         child: CustomText(text: "Are You A Repeater".tr),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  20.verticalSpace,
                  // CustomText(
                  //   text: 'Other Information',
                  // ),
                  // 5.verticalSpace,
                  // GlobalCustomTile(
                  //   margin: EdgeInsets.symmetric(
                  //       horizontal: MediaQuery.sizeOf(context).width * 0.00,
                  //       vertical: 0),
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 20, horizontal: 10),
                  //   borderRadius: BorderRadius.circular(10),
                  //   boxShadowColor: AppColors.lightGrey,
                  //   color: isDarkMode(context) ? Colors.black : Colors.white,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       CustomText(
                  //         text:
                  //             'Available Coins: ${context.read<UserViewModel>().userModel?.coin == null ? ' 0' : context.read<UserViewModel>().userModel?.coin.toString()}',
                  //         color: isDarkMode(context)
                  //             ? Colors.white
                  //             : AppColors.black,
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  20.verticalSpace,

                  // Get.find<TranslationService>().langCode.value == "en_US"
                  //     ? Row(
                  //         children: [
                  //           5.horizontalSpace,
                  //           Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(12)),
                  //                 color:
                  //                     context.read<ThemeViewModel>().appTheme ==
                  //                             AppThemeData
                  //                                 .appTheme[AppTheme.lightPure]!
                  //                         ? AppColors.white
                  //                         : AppColors.darkGrey,
                  //                 boxShadow:
                  //                     context.read<ThemeViewModel>().appTheme ==
                  //                             AppThemeData
                  //                                 .appTheme[AppTheme.lightPure]!
                  //                         ? [
                  //                             BoxShadow(
                  //                                 offset: Offset(0, 2),
                  //                                 color: Colors.grey,
                  //                                 blurRadius: 3)
                  //                           ]
                  //                         : [],
                  //               ),
                  //               padding: const EdgeInsets.all(5),
                  //               height: 90,
                  //               width: MediaQuery.of(context).size.width * 0.4,
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   SvgPicture.asset(
                  //                     AppImages.timer_tick,
                  //                     height: 30,
                  //                     width: 30,
                  //                   ),
                  //                   4.verticalSpace,
                  //                   CustomText(
                  //                     text: "Current Plan: ${"Advanced"}",
                  //                     fontSize: 15.sp,
                  //                     fontWeight: FontWeight.w500,
                  //                     color: context
                  //                                 .read<ThemeViewModel>()
                  //                                 .appTheme ==
                  //                             AppThemeData
                  //                                 .appTheme[AppTheme.lightPure]!
                  //                         ? AppColors.black
                  //                         : AppColors.white,
                  //                   ),
                  //                   CustomText(
                  //                     text: "Valid Till: ${"11/01/2025"}",
                  //                     fontSize: 14.sp,
                  //                     fontWeight: FontWeight.w500,
                  //                     color: context
                  //                                 .read<ThemeViewModel>()
                  //                                 .appTheme ==
                  //                             AppThemeData
                  //                                 .appTheme[AppTheme.lightPure]!
                  //                         ? AppColors.black
                  //                         : AppColors.white,
                  //                   ),
                  //                 ],
                  //               )),
                  //         ],
                  //       )
                  //     : Container(),
                  // 20.verticalSpace,

                  // DropdownButtonFormField<String>(
                  //   dropdownColor: AppColors.white,
                  //   value: isRepeaterValue,
                  //   decoration: InputDecoration(
                  //     labelText: "Are you a Repeater?",
                  //     hintStyle: const TextStyle(fontSize: 13),
                  //     contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  //     hintText: statedropdownValue == null ? "Select" : '',
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  //     // border: const UnderlineInputBorder(
                  //     //   // Use UnderlineInputBorder for bottom border
                  //     //   borderSide: BorderSide(
                  //     //     color: Color.fromRGBO(94, 24, 234, 0.2), // Set the color of the bottom border
                  //     //     width: 2, // Set the width of the bottom border
                  //     //   ),
                  //     // ),
                  //   ),
                  //   items: <String>[
                  //     'Select',
                  //     'Yes',
                  //     'No',
                  //   ].map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: CustomText(text:value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     isRepeaterValue = newValue;
                  //   },
                  // ),

                  // 30.verticalSpace,
                ],
              ),
            ),
            // context.watch<UserViewModel>().expiryTime == null ||
            //         context.watch<UserViewModel>().userPlan == UserPlan.noPlan
            //     ? const SizedBox.shrink()
            //     : Container(
            //         width: 40.w,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           color: Theme.of(context).colorScheme.surface,
            //           borderRadius: BorderRadius.circular(10),
            //           boxShadow: kElevationToShadow[1],
            //         ),
            //         padding: const EdgeInsets.all(16),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Icon(
            //               Icons.access_alarms,
            //               color: AppColors.darkRed,
            //               size: 34.px,
            //             ),
            //             5.verticalSpace,
            //             CustomText(
            //               textAlign: TextAlign.center,
            //               text:
            //                   "Current Plan: ${context.watch<UserViewModel>().userPlan.name.toUpperCase()}",
            //               fontSize: 14.5.sp,
            //               fontWeight: FontWeight.w600,
            //             ),
            //             5.verticalSpace,
            //             CustomText(
            //               textAlign: TextAlign.center,
            //               text:
            //                   "Valid Till: ${DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(context.watch<UserViewModel>().expiryTime!)
            //                       //     .add(
            //                       //   const Duration(days: 365),
            //                       // ),
            //                       )}",
            //               fontSize: 13.sp,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ],
            //         ),
            //       ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.enabled = true});

  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final TextInputType keyboardType;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.sizeOf(context).shortestSide;

    return Stack(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            maxLength: maxLength,
            controller: controller,
            enabled: enabled,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType,
            // onTapOutside: (event) {
            //   FocusScope.of(context).unfocus();
            // },
            decoration: InputDecoration(
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: TextStyle(fontSize: 14),
              // labelText: hintText,
              hintText: hintText,

              errorStyle: const TextStyle(
                color: Colors.red, // or any other color
              ),
              contentPadding: EdgeInsets.only(
                  bottom: shortestSide < 600 ? 8 : 15,
                  left: shortestSide < 600 ? 5 : 10,
                  top: shortestSide < 600 ? 0 : 10,
                  right: shortestSide < 600 ? 0 : 10),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // const UnderlineInputBorder(
              //
              //   // Use UnderlineInputBorder for bottom border
              //   borderSide: BorderSide(
              //     color: Color.fromRGBO(94, 24, 234, 0.2), // Set the color of the bottom border
              //     width: 2, // Set the width of the bottom border
              //   ),
              // ),
            ),
            validator: (value) {
              if (value?.isEmpty == true || value == null) {
                return "required".tr;
              }
              if (hintText == "phoneNumber".tr) {
                if (validateMobile(value.trim()) != null) {
                  return validateMobile(value.trim());
                } else {
                  return null;
                }
              }
              if (hintText == "parentPhoneNumber".tr) {
                if (validateMobile(value.trim()) != null) {
                  return validateMobile(value.trim());
                } else {
                  return null;
                }
              }
              if (hintText == "firstName".tr || hintText == "lastName".tr) {
                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                  return "Invalid ${hintText.toLowerCase()}!";
                }
              }
              // if (hintText == "email".tr) {
              //   return Validators.validateEmail(value);
              // }
              return null;
            },
          ),
        ),
        Positioned(
            left: 12,
            top: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomText(
                  text: hintText,
                ),
              ),
            )),
      ],
    );
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number'.tr;
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number'.tr;
    }
    return null;
  }
}

class ReusableWidgets {
  static AppBar myAppBar(
      {required BuildContext context,
      required String title,
      List<Widget>? actions}) {
    return AppBar(
      leading: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // if (context
            //     .read<SubjectViewModel>()
            //     .selectedTopicModel!
            //     .isBookmark) {
            //   context.read<SubjectViewModel>().updateBookmarkTopics();
            // }
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
      elevation: 0,
      actions: actions,
      //
      title: CustomText(
        text: title,
        fontName: AppFont.quando,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static AppBar myAppBarWithLeading({
    required BuildContext context,
    required String title,
    required VoidCallback onLeadingPress,
    List<Widget>? actions,
    double? elevation,
  }) {
    return AppBar(
      actions: actions,
      leading: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onLeadingPress,
          child: const Icon(Icons.arrow_back_ios)),
      elevation: elevation,
      title: CustomText(
        text: title,
      ),
    );
  }

  static AppBar myAppBarWithActionIcon({
    required BuildContext context,
    required String title,
    required List<Widget>? actions,
    double? elevation,
  }) {
    return AppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      actions: actions,
      elevation: elevation,
      title: CustomText(
        text: title,
      ),
    );
  }

  static AppBar myAppBarWithoutLeadingIcon(
      {required BuildContext context,
      required String title,
      bool? centerTitle}) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      elevation: 0,
      title: CustomText(
        text: title,
      ),
    );
  }
}
