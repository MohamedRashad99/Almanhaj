// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:almanhaj/generated/assets.dart';
import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:almanhaj/screens/banner_details/page/views/ads_spaces.dart';
import 'package:almanhaj/screens/home_screen/page/views/banner_slider/cubit/slider_cubit.dart';
import 'package:almanhaj/screens/home_screen/page/views/user_section_selected/cubit_section_name/sections_names_cubit.dart';
import 'package:almanhaj/screens/list_of_newest_added/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'page/views/banner_slider/banner_slider.dart';
import '../components/appBar.dart';
import '../components/constants.dart';
import 'page/views/menue_items.dart';
import 'page/views/sections_titles/section_title.dart';
import 'page/views/speed_dial.dart';
import 'page/views/user_section_selected/user_section_selected.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: customAppBar(
          context: context,
          press: () => scaffoldKey.currentState!.openEndDrawer()),
      endDrawer: MenueItems(),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: ListView(
        primary: true,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: height * 0.42,
                width: width,
                decoration: BoxDecoration(
                    // color: Colors.lightBlue,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: HexColor("#E6EEF7"),
                          offset: const Offset(0, 3),
                          blurRadius: 3,
                          spreadRadius: 3)
                    ]),
                child: BlocConsumer<SliderCubit, SliderState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SliderLoading) {
                      return const Center(
                          child: SpinKitChasingDots(
                        color: kPrimaryBlueColor,
                        size: 40,
                      ));
                    }
                    if (state is SliderSuccess) {
                      return Column(
                        children: [
                          SectionTitles(
                              title1: "أحداث الاضافات",
                              title2: " كل الملازم و المذكرات",
                              onTapDescription2: () {
                                //interstitialAd.show();
                                Get.to(() =>
                                    ListOfNewestAdded(sliders: state.sliders));
                              }),
                          BannerSlider(sliders: state.sliders),
                        ],
                      );
                    }
                    if (state is SliderError) {
                      return Center(child: Image.asset(Assets.image.logo2021));
                    }
                    return const SizedBox();
                  },
                ),
              ),
              const AdsSpaces(),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                primary: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
                  final name = LocalStorage.getString("selectedClassesName");
                  final id2 = LocalStorage.getInt("selectedClassesId");
                  log(id2.toString());

                  return BlocProvider(
                    create: (context) => SectionsNamesCubit(id: id2),
                    child: BlocConsumer<SectionsNamesCubit, SectionsNamesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is SectionsNamesLoading) {
                          return const Center(
                              child: SpinKitChasingDots(
                            color: kPrimaryBlueColor,
                            size: 10,
                          ));
                        }
                        if (state is SectionsNamesEmpty){
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: UserSectionSelected(
                              isEmpty: true,
                              className: name,
                              allNotes: "كل الملازم والمذكرات",
                              onTapAllNotes: () {},
                              section1: 'الفصل الدراسي الاول',
                              section2:' الفصل الدراسي الثاني',
                              onTapSection1: () {},
                              onTapSection2: () {},
                            ),
                          );
                        }
                        if (state is SectionsNamesSuccess) {
                          LocalStorage.setInt('KeySection1', state.sectionsNames[0].id);
                          LocalStorage.setInt('KeySection2', state.sectionsNames[1].id);
                          log('iiiiiiiiiiiiiiid'+LocalStorage.getInt('KeySection1').toString());
                          log('iiiiiiiiiiiiiiid'+LocalStorage.getInt('KeySection2').toString());
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: UserSectionSelected(
                              className: name,
                              allNotes: "كل الملازم والمذكرات",
                              onTapAllNotes: () {},
                              section1: state.sectionsNames[0].name,
                              section2:state.sectionsNames[1].name,
                              onTapSection1: () {},
                              onTapSection2: () {},
                            ),
                          );
                        }
                        if (state is SectionsNamesError) {
                          return Center(child: Text(state.msg));
                        }
                        return const SizedBox();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
