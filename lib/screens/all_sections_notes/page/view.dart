// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:almanhaj/screens/home_screen/page/views/user_section_selected/cubit_section_name/sections_names_cubit.dart';

import '../cubit/all_sections_notes_cubit.dart';
import 'views/subject_header.dart';
import '../../components/constants.dart';
import '../../components/fast_widget.dart';
import '../../home_screen/page/views/menue_items.dart';
import '../../home_screen/page/views/speed_dial.dart';
import '../../home_screen/view.dart';
import '../../list_of_selected_course/page/views/lesson_of_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListOfAllSectionNotes extends StatefulWidget {
  @override
  State<ListOfAllSectionNotes> createState() => _ListOfSelectedCourseState();
}

class _ListOfSelectedCourseState extends State<ListOfAllSectionNotes> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final id2 = LocalStorage.getInt("selectedClassesId");
    log(id2.toString());
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: customAppBar(
          context: context,
          press: () => scaffoldKey.currentState!.openEndDrawer()),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: MenueItems(),

      body: BlocProvider(
        create: (context) => AllSectionsNotesCubit(id: id2),
       child: BlocConsumer<AllSectionsNotesCubit, AllSectionsNotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AllSectionsNotesLoading) {
            return const Center(
                child: SpinKitChasingDots(
              color: kPrimaryBlueColor,
              size: 20,
            ));
          }
          if (state is AllSectionsNotesError) {
            return Center(child: Text(state.msg));
          }
          if (state is AllSectionsNotesSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  child: const SubjectHeader(
                    title1: "جميع الملازم والمذكرات المتاحة الان",
                    title2: "كافة المواد التعلمية",
                  ),
                  height: height * 0.075,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.allSectionSNotes.length,
                    //shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, int index) {
                      return CardLesson(
                        id: state.allSectionSNotes[index].id,
                        title1: state.allSectionSNotes[index].title.rendered,
                        title2: state.allSectionSNotes[index].content.rendered,
                        image:
                            state.allSectionSNotes[index].xFeaturedMediaMedium,
                      );
                    },
                  ),
                ),
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
