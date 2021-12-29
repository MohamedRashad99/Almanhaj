// ignore_for_file: use_key_in_widget_constructors

import 'package:almanhaj/generated/assets.dart';
import 'package:almanhaj/screens/all_sections_notes/page/views/subject_header.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/home_screen/page/views/menue_items.dart';
import 'package:almanhaj/screens/home_screen/page/views/speed_dial.dart';
import 'package:almanhaj/screens/home_screen/view.dart';

import 'package:almanhaj/screens/list_of_subject_course/cubit/list_of_course_selected_cubit.dart';
import 'package:almanhaj/screens/list_of_subject_course/page/views/card_List_of_course_selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListOfCourseSelectedScreen extends StatefulWidget {
  final int id;

  const ListOfCourseSelectedScreen({required this.id});

  @override
  State<ListOfCourseSelectedScreen> createState() => _ListOfCourseSelectedScreenState();
}

class _ListOfCourseSelectedScreenState extends State<ListOfCourseSelectedScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: customAppBar(context: context, press: () => scaffoldKey.currentState!.openEndDrawer()),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: MenueItems(),

      body: BlocProvider(
        create: (context) => ListOfCourseSelectedCubit(id: widget.id),
        child: BlocConsumer<ListOfCourseSelectedCubit, ListOfCourseSelectedState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ListOfCourseSelectedLoading) {
              return const Center(
                  child: SpinKitChasingDots(
                    color: kPrimaryBlueColor,
                    size: 40,
                  ));
            }
            if (state is ListOfCourseSelectedSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: const SubjectHeader(
                      title1: ' يوجد العديد من المذاكرات المراجعة النهائية لهذا العام ',
                      title2: 'أحصل علي المذكرة المفضلة لديك الاّن ',
                    ),
                    height: height * 0.075,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.listOfCourseSelected.length,

                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return  CardListOfCourseSelected(
                            id: state.listOfCourseSelected[index].id,
                            title1: state.listOfCourseSelected[index].title.rendered,
                            image: state.listOfCourseSelected[index].xFeaturedMediaMedium


                        );
                      },
                    ),
                  )
                ],
              );
            }
            if (state is ListOfCourseSelectedEmpty) {
              return const Center(
                child: Text(
                  " لا يوجد نتائج الاّن ",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Khebrat Musamim"),
                ),
              );
            }
            if (state is ListOfCourseSelectedError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.2,),
                 const  Text(
                    " لا يوجد نتائج الاّن ",
                    style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Khebrat Musamim"),
                  ),
                  SizedBox(height: height*0.02,),
                  Image.asset(Assets.image.basket,fit: BoxFit.contain,),
                ],
              );
            }
            return const SizedBox();
          },
        ),
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
          navigateAndFinish(context, const HomeScreen());
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
