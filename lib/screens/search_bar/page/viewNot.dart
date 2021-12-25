



import '../../components/constants.dart';
import '../../list_of_selected_course/page/views/lesson_of_card.dart';
import 'package:flutter/material.dart';

class SubjectOfSearch extends SearchDelegate {

  // TODO try to change background cause it take by default blue
  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return QTheme.;
  // }


  SubjectOfSearch()
      : super(
            searchFieldLabel: 'البحث',
            searchFieldStyle: headingStyle.copyWith(
              color: Colors.grey,
              fontSize: 18,
            ));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Expanded(
        child: ListView.builder(
          itemCount: 4,
          //shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, int index) {
            return const CardLesson(
              id: 3,
               title1:  "مذكرة تأسيس لغه عربية أولي ثانوي 2021",
                title2: "تم تصوير كل خطوه وكل جزء من التسطيب بحيث توصل المعلومه كامله للما الصورة اللي في البوست دا كل تعريفات الجهاز اتعملمت من الوندوز دون الاحتياج",
                image: "assets/image/logo2021.png");
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Expanded(
        child: ListView.builder(
          itemCount: 1,
          //shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, int index) {
            return const CardLesson(
              id: 3,
               title1: "مذكرة تأسيس لغه عربية أولي ثانوي 2021",
              title2:   "تم تصوير كل خطوه وكل جزء من التسطيب بحيث توصل المعلومه كامله للما الصورة اللي في البوست دا كل تعريفات الجهاز اتعملمت من الوندوز دون الاحتياج",
               image:  "assets/image/logo2021.png");
          },
        ),
      ),
    );
  }
}
