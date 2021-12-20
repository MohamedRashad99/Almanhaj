// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'constants.dart';

class DoNotHave extends StatelessWidget {
  final String? text;
  final String? have;
  final VoidCallback? route;
  // ignore: use_key_in_widget_constructors
  const DoNotHave({this.text, this.route, this.have});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(have!,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "dinnextl bold",
                color: kTextColor,
              )),
          GestureDetector(
            onTap: route,
            child: Text(text!,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "dinnextl bold",
                  color: kPrimaryColor,
                )),
          ),
        ],
      ),
    );
  }
}
