// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:almanhaj/config/ads_manager.dart';
import 'cubit/slider_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'page/views/content_subject_header.dart';
import 'page/views/subject_description_data.dart';
import 'page/views/subject_download_file.dart';
import '../components/constants.dart';
import '../home_screen/page/views/speed_dial.dart';
import '../home_screen/view.dart';

class BannerDetailsScreen extends StatefulWidget {
  final int? id;

  const BannerDetailsScreen({Key? key, this.id}) : super(key: key);

  @override
  State<BannerDetailsScreen> createState() => _BannerDetailsScreenState();
}

class _BannerDetailsScreenState extends State<BannerDetailsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: kBackgroundColor,
        appBar: buildAppBar(context),
        floatingActionButton: FloatingActionView(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: SizedBox(
          height: height,
          width: width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
                primary: true,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                physics: const BouncingScrollPhysics(),
                children: [
                  BlocProvider(
                    create: (context) => SliderDetailsCubit(id: widget.id!),
                    child: BlocConsumer<SliderDetailsCubit, SliderDetailsState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                          if (state is SliderDetailsLoading){
                            return const Center(child: SpinKitChasingDots(
                              color: kPrimaryBlueColor,
                              size: 40,
                            ));

                          }
                          if(state is SliderDetailsSuccess){
                            return Wrap(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ignore: unnecessary_null_comparison
                                state.sliderDetails.xFeaturedMediaMedium != null?  Container(
                                  height: height * 0.4,
                                  width: width * 0.95,
                                  margin: EdgeInsets.symmetric(vertical: 8,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image:  DecorationImage(
                                        image: NetworkImage(
                                          state.sliderDetails.xFeaturedMediaMedium
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ):const SizedBox(),
                                if (_isBannerAdReady)
                                  SizedBox(
                                    height: _bannerAd.size.height.toDouble(),
                                    width: _bannerAd.size.width.toDouble(),
                                    child: AdWidget(ad: _bannerAd),
                                  ),
                                ContentSubjectHeader(
                                    title: state.sliderDetails.title.rendered,
                                    date: state.sliderDetails.xDate,
                                    authorName: state.sliderDetails.xAuthor
                                ),
                                SubjectDescriptionView(
                                    description:  state.sliderDetails.content.rendered),
                                //TODO Ads
                              //  const AdsSpaces(),
                                 SubjectDownloadFile(

                                    fileName: state.sliderDetails.filetitle,
                                    fileSize:  state.sliderDetails.filesize,
                                    fileType:  state.sliderDetails.filetype,
                                    itemUrl: state.sliderDetails.fileurl

                        ),
                              ],
                            );
                          }
                          if(state is SliderDetailsError){
                            return Center(child: Text(state.msg!));
                          }
                          return const SizedBox();
                      },
                    ),
                  ),
                ]),
          ),
        ));
  }

  adsSpaces(double height, double width) {
    return Container(

      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kLightGreenColor.withOpacity(0.2),
      ),
      height: height,
      width: width,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          Get.off(() => const HomeScreen());
          //  navigateAndFinish(context,const HomeView());
        },
        child: Image.asset(
          "assets/image/logo2021-2.png",
          width: 130,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 40,
          ),
        ),
      ],
    );
  }
}
