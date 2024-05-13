// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:developer';

import 'package:epics_pj/view/pages/custom_text.dart';
import 'package:epics_pj/view/pages/faq.dart';
import 'package:epics_pj/view/pages/images.dart';
import 'package:epics_pj/view/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactSupport extends StatefulWidget {
  static const String route = "/contact-support";

  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
  int gvalue = 0;

  List<int> gvalues = [0, 1, 2, 3, 4, 5];
  List<String> languages = [
    'English',
    'Hindi',
    'Kannada',
    'Marathi',
    'Tamil',
    'Telugu'
  ];

  getDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Select Language',
                            fontSize: 20.0,
                            fontName: AppFont.quando,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.highlight_remove_rounded,
                                color: AppColors.primaryColor,
                              ))
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: gvalues.length,
                        itemBuilder: (context, position) {
                          return ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: CustomText(
                                text: languages[position],
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              leading: Radio(
                                  value: gvalues[position],
                                  groupValue: gvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      gvalue = int.parse(value.toString());
                                    });
                                  }));
                        }),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () async {
                        // final phone = await Provider.of<UserViewModel>(context,
                        //         listen: false)
                        //     .initiateCall(context, gvalue);

                        makeCall("8595713216");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            CustomText(
                              textAlign: TextAlign.center,
                              text: "Initiate Call Request",
                              fontSize: 17,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  makeCall(String phone) async {
    final Uri url = Uri(
      scheme: AppStrings.tel,
      path: phone,
    );
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => Navigator.pop(context),
            child: const Icon(
              FontAwesomeIcons.angleLeft,
            )),
        elevation: 0,
        title: CustomText(
          text: "Help".tr,
          fontSize: 19,
          fontName: AppFont.quando,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          20.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              text: "For Instant Support".tr,
              color: AppColors.darkGrey,
              fontSize: 16,
              fontName: AppFont.fredoka,
              fontWeight: FontWeight.w600,
            ),
          ),
          30.verticalSpace,
          CustomElevatedButton(
            // backgroundColor: AppColors.white,
            icon: Icons.call,
            iconSize: 30.0,
            // iconColor:
            //     isDarkMode(context) ? Colors.white : Theme.of(context).colorScheme.primary,
            imageSize: 4.0,
            buttonText: "Call (Timing 10 AM-10 PM)".tr,
            textColor: Colors.blue,
            onPressed: () async {
              getDialog(context);
            },
          ),
          10.verticalSpace,
          CustomElevatedButton(
            // backgroundColor: AppColors.white,
            image: AppImages.telegram_logo,
            buttonText: "Join Telegram".tr,
            textColor: Colors.blue,
            imageSize: 4.0,
            iconColor: Theme.of(context).colorScheme.primary,
            onPressed: () async {
              await launchUrl(Uri.parse(AppUrls.telegramUrl));
            },
          ),
          10.verticalSpace,
          CustomElevatedButton(
            // backgroundColor: AppColors.white,
            icon: Icons.email,
            iconSize: 30.0,
            buttonText: "Send Email".tr,
            textColor: Colors.blue,
            imageSize: 4.0,
            onPressed: () async {
              String userId = FirebaseAuth.instance.currentUser!.uid;
              String appVersion = "1.0.0";
              // context.read<UserViewModel>().userModel!.appVersion!;
              launchUrl(Uri.parse(
                  'mailto:${AppStrings.supportEmail}?subject=$userId:Testing Version: $appVersion'));
            },
          ),
          10.verticalSpace,
          CustomElevatedButton(
            // backgroundColor: AppColors.white,
            icon: Icons.contact_phone,
            iconSize: 30.0,
            buttonText: "Contact Us",
            textColor: Colors.blue,
            imageSize: 4.0,
            onPressed: () async {
              launchUrl(Uri.parse(AppUrls.contactUrl));
            },
          ),
        ],
      )),
    );
  }
}
