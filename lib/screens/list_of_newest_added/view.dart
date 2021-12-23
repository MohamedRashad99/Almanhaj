// ignore_for_file: use_key_in_widget_constructors

import 'package:almanhaj/screens/list_of_selected_course/page/views/lesson_of_card.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/banner_details/view.dart';
import 'page/views/subject_header.dart';
import '../components/constants.dart';
import '../components/fast_widget.dart';
import '../home_screen/page/views/menue_items.dart';
import '../home_screen/page/views/speed_dial.dart';
import '../home_screen/view.dart';

class ListOfSelectedCourse extends StatefulWidget {
  @override
  State<ListOfSelectedCourse> createState() => _ListOfSelectedCourseState();
}

class _ListOfSelectedCourseState extends State<ListOfSelectedCourse> {
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
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: MenueItems(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            child: SubjectHeader(),
            height: height * 0.075,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              //shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, int index) {
                return const  CardLesson(
                    "مذكرة تأسيس لغه عربية أولي ثانوي 2021",
                    "تم تصوير كل خطوه وكل جزء من التسطيب بحيث توصل المعلومه كامله للما الصورة اللي في البوست دا كل تعريفات الجهاز اتعملمت من الوندوز دون الاحتياج",
                    "assets/image/logo2021.png");
              },
            ),
          )
        ],
      ),
    );
  }

  customAppBar({required BuildContext context, required VoidCallback press}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          navigateAndFinish(context, const HomeView());
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
            onPressed: press,
            icon: const Icon(
              Icons.format_align_justify,
              color: Colors.black,
              size: 30,
            )),
      ],
    );
  }
}
