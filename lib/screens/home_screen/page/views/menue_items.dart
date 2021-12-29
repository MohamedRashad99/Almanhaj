// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:almanhaj/config/ads_manager.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/home_screen/view.dart';
import 'package:almanhaj/screens/notify_study_timing/view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../student_class_select/view.dart';

class MenueItems extends StatefulWidget {
  @override
  _MenueItemsState createState() => _MenueItemsState();
}

class _MenueItemsState extends State<MenueItems> {
  /// ********************** Ads Concept *************************
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  late InterstitialAd _interstitialAd;

  bool _isInterstitialAdReady = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      // Change Banner Size According to Ur Need
        size: AdSize.banner,
        adUnitId: AdHelper.getBannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, LoadAdError error) {
          log("Failed to Load A Banner Ad${error.message}");
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: const AdRequest())
      ..load();
    //Interstitial Ads
    InterstitialAd.load(

        adUnitId: AdHelper.getInterstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
        }, onAdFailedToLoad: (LoadAdError error) {
          log("failed to Load Interstitial Ad ${error.message}");
        }));


  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
    _interstitialAd.dispose();
  }

  /// -----------------------------------------------------------------------


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
                      log('${ _isInterstitialAdReady ? _interstitialAd.show() : "مجاااااااااااااااااااااااش"}');
                      navigateAndFinish(context, const HomeScreen());
                    },
                    title: buildTextName(
                      "الرئيسية",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      log('${ _isInterstitialAdReady ? _interstitialAd.show() : "مجاااااااااااااااااااااااش"}');

                      navigateTo(context, StudentClassSelectScreen());
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
                      log('${ _isInterstitialAdReady ? _interstitialAd.show() : "مجاااااااااااااااااااااااش"}');
                     // navigateTo(context, NotifyStudyTimingView());
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
