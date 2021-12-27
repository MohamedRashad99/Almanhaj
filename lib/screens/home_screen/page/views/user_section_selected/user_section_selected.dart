// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:almanhaj/config/ads_manager.dart';
import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:almanhaj/screens/all_sections_notes/page/view.dart';
import 'package:almanhaj/screens/home_screen/page/views/user_section_selected/cubit_show_subjects/show_subjects_cubit.dart';
import 'package:almanhaj/screens/list_of_subject_course/page/view.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/list_of_selected_course/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class UserSectionSelected extends StatefulWidget {
  final int classId;
  final String? className;
  final String? allNotes;
  final VoidCallback? onTapAllNotes;
  final String? section1;
  final String? section2;
  final VoidCallback? onTapSection1;
  bool isEmpty;
  final VoidCallback? onTapSection2;

  late bool isPrssed1;

  late bool isPrssed2;

  UserSectionSelected({
    this.isEmpty = false,
    this.isPrssed1 = false,
    this.isPrssed2 = false,
    required this.classId,
    required this.className,
    required this.allNotes,
    required this.onTapAllNotes,
    required this.section1,
    required this.section2,
    required this.onTapSection1,
    required this.onTapSection2,
  });

  @override
  State<UserSectionSelected> createState() => _UserSectionSelectedState();
}

class _UserSectionSelectedState extends State<UserSectionSelected> {
  int? value;


  /// ********************** Ads Concept *************************


  late InterstitialAd _interstitialAd;

  bool _isInterstitialAdReady = false;

  @override
  void initState() {
    super.initState();

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

    _interstitialAd.dispose();
  }

  /// -----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final int sectionId1 = LocalStorage.getInt('KeySection1');
    final int sectionId2 = LocalStorage.getInt('KeySection2');
    int id = sectionId1;
    log('seeeeeeeeee' + id.toString());

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ShowSubjectsCubit(
        id: id,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // color: Colors.amber,
          height: height * 0.2,
          //width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            //color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 30,
                    ),
                    spaceW(5),
                    Text(
                      widget.className!,
                      style: headingStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                InkWell(
                  onTap: () {
                    widget.onTapAllNotes;
                    log('${ _isInterstitialAdReady ? _interstitialAd.show() : "مجاااااااااااااااااااااااش"}');

                    Get.to(()=>ListOfAllSectionNotes(id: widget.classId,) );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: HexColor("#3080D1"),
                        size: 30,
                      ),
                      spaceW(5),
                      Text(
                        widget.allNotes!,
                        style: headingStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kPrimaryBlueColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            BlocConsumer<ShowSubjectsCubit, ShowSubjectsState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            widget.onTapSection1;
                            setState(() {
                              widget.isPrssed1 = true;
                              widget.isPrssed2 = false;
                              value = 1;
                            });
                          },
                          child: Text(
                            widget.section1!,
                            style: headingStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 14, color: value == 1 ? kPrimaryBlueColor : Colors.black),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          width: width * 0.1,
                          child: Center(child: Text("|", style: headingStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black))),
                        ),
                        InkWell(
                          onTap: () {
                            widget.onTapSection2;
                            setState(() {
                              widget.isPrssed2 = true;
                              ShowSubjectsCubit.of(context).getShowSubjects(id: sectionId2);
                              widget.isPrssed1 = false;
                              value = 2;
                            });
                          },
                          child: Text(
                            widget.section2!,
                            style: headingStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: value == 2 ? kPrimaryBlueColor : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    if (state is ShowSubjectsLoading && !widget.isEmpty)
                      const Center(
                          child: SpinKitChasingDots(
                        color: kPrimaryBlueColor,
                        size: 10,
                      )),
                    if (state is ShowSubjectsSuccess && !widget.isEmpty)
                      SizedBox(
                        width: width,
                        height: height * 0.03,
                        child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.showSubjects.length,
                          itemBuilder: (context, int index) {
                            return InkWell(
                              onTap: () {
                                navigateTo(
                                    context,
                                    ListOfCourseSelected(
                                      id: id,
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                height: height * 0.03,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                  color: kPrimaryBlueColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    state.showSubjects[index].name!,
                                    style: headingStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 8, color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    if (state is ShowSubjectsError && !widget.isEmpty) Center(child: Text(state.msg)),
                    if (widget.isEmpty)
                      const Text(
                        "غير متوفر الاّن ",
                        style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: "Khebrat Musamim",fontWeight: FontWeight.w400),
                      ),
                  ],
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
