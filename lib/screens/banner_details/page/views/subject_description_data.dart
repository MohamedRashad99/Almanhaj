// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
class SubjectDescriptionView extends StatefulWidget {
  final String description;

  const SubjectDescriptionView({Key? key, required this.description})
      : super(key: key);
  @override
  _SubjectDescriptionViewState createState() => _SubjectDescriptionViewState();
}

class _SubjectDescriptionViewState extends State<SubjectDescriptionView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
     // height: height*0.4,

      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: HexColor("#E6EEF7"),
                offset: const Offset(0, 3),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Text(
        parseHtmlString(widget.description),
        textAlign: TextAlign.start,

        style: headingStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: HexColor("#666666")),
      ),
    );
  }
}
