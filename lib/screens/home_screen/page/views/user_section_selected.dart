// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/list_of_selected_course/view.dart';

// ignore: must_be_immutable
class UserSectionSelected extends StatefulWidget {
  final String? title1;
  final String? title2;
  final VoidCallback? onTapDescription1;
  final VoidCallback? onTapDescription2;
  final String? section1;
  final String? section2;
  final VoidCallback? onTapSection1;
  final VoidCallback? onTapSection2;

  late bool isPrssed1;

  late bool isPrssed2;

  UserSectionSelected({
    this.isPrssed1 = false,
    this.isPrssed2 = false,
    required this.title1,
    required this.title2,
    required this.onTapDescription1,
    required this.onTapDescription2,
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
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
              InkWell(
                onTap: widget.onTapDescription1,
                child: Row(
                  children: [
                    const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 30,
                    ),
                    spaceW(5),
                    Text(
                      widget.title1!,
                      style: headingStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.08,
              ),
              InkWell(
                onTap: () {
                  widget.onTapDescription2;
                  navigateTo(context, ListOfSelectedCourse());
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
                      widget.title2!,
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
                  style: headingStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: value == 1 ? kPrimaryBlueColor : Colors.black),
                ),
              ),
              Container(
                color: Colors.white,
                width: width * 0.1,
                child: Center(
                    child: Text("|",
                        style: headingStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black))),
              ),
              InkWell(
                onTap: () {
                  widget.onTapSection2;
                  setState(() {
                    widget.isPrssed2 = true;
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
          Container(
            width: width,
            height: height * 0.03,
            child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    navigateTo(context, ListOfSelectedCourse());
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
                        "اللغه العربية",
                        style: headingStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
