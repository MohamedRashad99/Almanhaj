// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../../../components/fast_widget.dart';
class SubjectHeader extends StatelessWidget {

  final String title1;
  final String title2;
  const SubjectHeader({required this.title1,required this.title2});



  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      padding: EdgeInsets.symmetric(vertical: 3),
      //color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
             // "أحدث الاضافات",
              title1,
              style: headingStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: HexColor("#323232")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),            child: Text(
              parseHtmlString(
                 // " يوجد العديد من المذاكرات المراجعه النهائيه لهذا العام اغتنم الفرصه "
                title2
              ),
              maxLines: 3,
              style: headingStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: HexColor("#666666")),
            ),
          )
        ],
      ),
    );
  }
}
