// ignore_for_file: use_key_in_widget_constructors

import 'package:almanhaj/screens/banner_details/page/views/ads_spaces.dart';
import 'package:almanhaj/screens/list_of_selected_course/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page/views/banner_slider.dart';
import '../components/appBar.dart';
import '../components/constants.dart';
import 'page/views/menue_items.dart';
import 'page/views/section_title.dart';
import 'page/views/speed_dial.dart';
import 'page/views/user_section_selected.dart';

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
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                child: Column(
                  children: [
                    SectionTitles(
                        title1: "أحداث الاضافات",
                        title2: " كل الملازم و المذكرات",
                        onTapDescription2: () {
                          //interstitialAd.show();
                          Get.to(()=>ListOfSelectedCourse());
                        }),
                    BannerSlider(),
                  ],
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
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: UserSectionSelected(
                      title1: "الصف الثالث الثانوي",
                      title2: "كل الملازم والمذكرات",
                      onTapDescription1: () {
                        //interstitialAd.show();
                      },
                      onTapDescription2: () {},
                      section1: "الفصل الدراسي الاول",
                      section2: "الفصل الدراسي الثاني",
                      onTapSection1: () {},
                      onTapSection2: () {},
                    ),
                  );
                },
              ),
              SizedBox(height: height*0.1,),
            ],
          )
        ],
      ),
    );
  }
}
