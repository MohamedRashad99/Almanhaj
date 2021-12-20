// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/home_screen/view.dart';
import 'package:almanhaj/screens/notify_study_timing/view.dart';
import 'package:almanhaj/screens/student_class_select/page/view.dart';

class MenueItems extends StatefulWidget {
  @override
  _MenueItemsState createState() => _MenueItemsState();
}

class _MenueItemsState extends State<MenueItems> {
  // AdmobBannerSize? bannerSize;
  // late AdmobInterstitial interstitialAd;
  // late AdmobReward rewardAd;
  //
  // void handleEvent(
  //     AdmobAdEvent event, Map<String, dynamic>? args, String adType) {
  //   switch (event) {
  //     case AdmobAdEvent.rewarded:
  //       break;
  //     default:
  //   }
  // }
  //
  // String? getInterstitialAdUnitId() {
  //   if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/4411468910';
  //   } else if (Platform.isAndroid) {
  //     return 'ca-app-pub-6460577785255164/6757169449';
  //   }
  //   return null;
  // }

  // @override
  // void initState() {
  //   bannerSize = AdmobBannerSize.BANNER;
  //
  //   interstitialAd = AdmobInterstitial(
  //     adUnitId: getInterstitialAdUnitId()!,
  //     listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
  //       if (event == AdmobAdEvent.closed) interstitialAd.load();
  //       handleEvent(event, args, 'Interstitial');
  //     },
  //   );
  //
  //   interstitialAd.load();
  //
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   interstitialAd.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0.0,
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            width: 130,
            height: 60,
            child: DrawerHeader(
                child: Center(
              child: Image.asset(
                "assets/image/logo2021-2.png",
                fit: BoxFit.cover,
              ),
            )),
          ),
          buildContainer(),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: buildIcon(Icons.house),
                    onTap: () {
                      // interstitialAd.show();
                      navigateAndFinish(context, const HomeView());
                    },
                    title: buildTextName(
                      "الرئيسية",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      //  interstitialAd.show();
                      navigateTo(context, StudentClassSelectView());
                    },
                    leading: buildIcon(
                      Icons.person_add,
                    ),
                    title: buildTextName(
                      "إعدادات الصفوف المفضلة",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // interstitialAd.show();
                      navigateTo(context, NotifyStudyTimingView());
                    },
                    leading: buildIcon(
                      Icons.date_range,
                    ),
                    title: buildTextName(
                      "تنبيهات مواعيد المذاكرة",
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildContainer(),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Column(
                children: [
                  buildText("تنفيذ شركة تكنو مصر للبرمجيات"),
                  spaceH(10),
                  buildText("www.technomasr.com"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon buildIcon(IconData icon) {
    return Icon(
      icon,
      color: HexColor("#323232"),
    );
  }

  Text buildTextName(String title) {
    return Text(
      // "الرئيسية",
      title,
      style: headingStyle.copyWith(
          color: HexColor("#323232"),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );
  }

  Container buildContainer() => Container(
        height: 0.25,
        color: Colors.black,
      );

  Text buildText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: headingStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: HexColor("#175798")),
    );
  }
}
