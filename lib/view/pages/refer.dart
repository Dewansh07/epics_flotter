import 'package:epics_pj/view/pages/custom_text.dart';
import 'package:epics_pj/view/pages/images.dart';
import 'package:epics_pj/view/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class ReferAndEarnView extends StatefulWidget {
  static const String route = "/referAndEarnView";
  const ReferAndEarnView({super.key});

  @override
  State<ReferAndEarnView> createState() => _ReferAndEarnViewState();
}

class _ReferAndEarnViewState extends State<ReferAndEarnView> {
  static late String linkFinal;

  Future<String> referralDynamicLink() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid
        .toString(); // Add your logic to get the user ID

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://TrashforTreasure.page.link',
      link: Uri.parse('https://TrashforTreasure.page.link/?invitedby=$uid'),
      androidParameters: const AndroidParameters(
        packageName: 'com.adithya.memoneet',
        minimumVersion: 48,
      ),
      iosParameters: const IOSParameters(
        appStoreId: 'id1664948488',
        bundleId: 'com.memoapps.memoneet',
        minimumVersion: '1.0.0',
      ),
      googleAnalyticsParameters: const GoogleAnalyticsParameters(
        source: 'Referral',
        medium: 'Youtube',
        campaign: 'Referral',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Get 360/360 in Neet Biology using MemoNeet',
        description:
            'MemoNeet Biology app \nLine by Line NCERT syllabus covered \nBest for people who start preparation from now \nCan cover the whole Biology in 90 days\n*Approved by NTA - 340+/360 guaranteed in Biology!*',
        imageUrl: Uri.parse(
            'https://firebasestorage.googleapis.com/v0/b/memoneet-5498.appspot.com/o/memoneet_dp.jpg?alt=media&token=0ab8a5e6-9682-4a02-a117-eb27e7eb6390'),
      ),
    );

    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    final Uri mInvitationUrl = shortLink.shortUrl;

    final String link = "$mInvitationUrl";
    setState(() {
      linkFinal = link;
    });
    return link;
  }

  @override
  void initState() {
    referralDynamicLink();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.sizeOf(context).shortestSide;
    final String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "referAndEarn".tr),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          final String message = 'Hey ';
          await Share.share(message);
        },
        child: GlobalCustomTile(
          height: 60,
          margin: shortestSide < 600
              ? const EdgeInsets.symmetric(vertical: 25, horizontal: 20)
              : EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.25,
                  vertical: 10),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
          boxShadowColor: AppColors.primaryColor2,
          child: Center(
            child: CustomText(
              text: "referFriend".tr,
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 180),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.refer_and_earn_new),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomText(
                text: "referToYourFriendGet200OFF".tr,
                fontWeight: FontWeight.w500,
                fontSize: 34,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomText(
                text: "copyYourCodeShareWithFriends".tr,
                fontSize: 18,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomText(
                text: "yourReferralCode".tr,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            GlobalCustomTile(
              margin: const EdgeInsets.all(0),
              boxShadowColor: AppColors.greenCorrectButtonColorShadow,
              color: AppColors.greenCorrectButtonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                        text: uid,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (linkFinal.isNotEmpty) {
                        Clipboard.setData(ClipboardData(text: linkFinal))
                            .then((_) {
                          showSnackBar(context: context, message: "Copied".tr);
                        });
                      } else {
                        showSnackBar(
                            context: context, message: "loadingRefer".tr);
                      }
                    },
                    icon: const Icon(Icons.copy_outlined),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomText(
                text: "howItWorks".tr,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: AppColors.grey),
              ),
              child: ListTile(
                leading: const Icon(Icons.copy_outlined),
                title: CustomText(
                  text: "inviteYourFriends".tr,
                ),
                subtitle: CustomText(text: "justShareLinkToFriend".tr),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: AppColors.grey),
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  AppImages.discount_check,
                  color: AppColors.black,
                ),
                title: CustomText(
                  text: "theyHitTheRoad".tr,
                ),
                subtitle: CustomText(
                  text: "with200OFF".tr,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: AppColors.grey),
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  AppImages.cash_earn,
                  color: AppColors.black,
                ),
                title: CustomText(
                  text: "youMakeSavings".tr,
                ),
                subtitle: CustomText(text: "thenYouGet200OFF".tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlobalCustomTile extends StatelessWidget {
  GlobalCustomTile({
    Key? key,
    required this.child,
    this.borderRadius,
    this.margin,
    this.padding,
    this.cardShadowColor,
    this.color,
    this.boxShadowColor,
    this.elevation,
    this.offset,
    this.width,
    this.height,
    this.decoration,
    this.alignment,
    this.onPressed,
  }) : super(key: key);
  final Widget child;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? margin, padding;
  AlignmentGeometry? alignment;
  Color? cardShadowColor;
  Color? color;
  Color? boxShadowColor;
  double? elevation;
  Offset? offset;
  double? width, height;
  Decoration? decoration;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      margin: margin ?? const EdgeInsets.all(10),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: decoration ??
          BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(15),
            color: color ?? Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: boxShadowColor ?? Theme.of(context).colorScheme.primary,
                offset: offset ?? const Offset(0, 5),
              ),
            ],
          ),
      child: child,
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  String? subTitle;
  double? fontSize;
  double? subTiltefontSize;
  FontWeight? fontWeight;
  Widget? infoBtn;
  void Function()? onPressed;
  bool isUnlock;
  bool isSideBorder;
  final Color fontColor;
  final Color bgColor;
  Color? subTitleColor;
  CustomTile({
    Key? key,
    required this.title,
    this.subTitle,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
    this.isUnlock = true,
    this.isSideBorder = false,
    this.subTiltefontSize,
    this.infoBtn,
    required this.fontColor,
    required this.bgColor,
    this.subTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          // minimumSize: const Size(double.infinity, 100),
          backgroundColor: bgColor,
          surfaceTintColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
        ),

        // style: ButtonStyle(
        //   textStyle: MaterialStatePropertyAll<TextStyle>(
        //     Theme.of(context).textTheme.bodySmall!.copyWith(color: fontColor),
        //   ),
        //   elevation: const MaterialStatePropertyAll<double>(1),

        //   overlayColor: MaterialStatePropertyAll<Color>(
        //     Theme.of(context).colorScheme.primary.withOpacity(.1),
        //   ),
        //   shadowColor: MaterialStatePropertyAll<Color>(
        //     Theme.of(context).colorScheme.shadow,
        //   ),
        //

        // ),

        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: isSideBorder
                ? Border(
                    top: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    ),
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 5,
                    ),
                  )
                : Border(
                    top: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 5,
                    ),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        color: fontColor,
                        fontWeight: fontWeight ?? FontWeight.w600,
                        fontSize: fontSize ?? 14.7,
                        textAlign: TextAlign.left,
                      ),
                      subTitle != null
                          ? CustomText(
                              text: subTitle,
                              color: subTitleColor ?? fontColor,
                              fontWeight: FontWeight.w500,
                              fontSize: subTiltefontSize ?? 12.7,
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                infoBtn != null ? infoBtn! : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isUnlock
                      ? Icon(
                          FontAwesomeIcons.angleRight,
                          size: 24,
                          color: fontColor,
                        )
                      : Icon(
                          Icons.lock,
                          size: 24,
                          color: Colors.red,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar({
  required BuildContext context,
  required String message,
}) {
  // print("showing snackbar");
  // Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color(0xFF363636).withOpacity(0.9),
    textColor: Colors.white,
    fontSize: 18.0,
  );
}

var logger = Logger();

void consoleLog(
  String message, {
  Level level = Level.info,
  dynamic data,
  Object? error,
  StackTrace? stack,
}) {
  String formattedMessage = '[${DateTime.now()}] [$level]: $message';
  if (data != null) {
    formattedMessage += '\nData: $data';
  }
  // if (level != null) {

  // } else {
  //   logger.d(message);
  // }
  switch (level) {
    case Level.all:
      logger.log(
        level,
        message,
        time: DateTime.now(),
        error: error,
        stackTrace: stack,
      );
      break;
    case Level.warning:
      logger.w(formattedMessage);
      break;
    case Level.fatal:
      logger.f(
        formattedMessage,
        stackTrace: stack,
      );
      break;
    case Level.error:
      logger.e(
        formattedMessage,
        error: error,
      );

    default:
      logger.i(
        formattedMessage,
        time: DateTime.now(),
      );
      break;
  }
}
