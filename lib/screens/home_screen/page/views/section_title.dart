// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/list_of_selected_course/view.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:get/get.dart';

class SectionTitles extends StatelessWidget {
  final String? title1;
  final String? title2;
  final void Function()? onTapDescription2;

  const SectionTitles(
      {required this.title1,
      required this.title2,
      required this.onTapDescription2});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),


        height: height * 0.065,
        decoration: BoxDecoration(
          color: Colors.white,
          //color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 30,
            ),
            spaceW(5),
            Text(
              title1!,
              style: headingStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            SizedBox(
              width: width * 0.08,
            ),
            InkWell(
              onTap:
                onTapDescription2,
                //Get.to(()=>ListOfSelectedCourse());

              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: HexColor("#3080D1"),
                    size: 30,
                  ),
                  spaceW(5),
                  Text(
                    title2!,
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
      ),
    );
  }
}
