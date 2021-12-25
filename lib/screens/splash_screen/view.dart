import 'dart:async';

import 'package:almanhaj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/student_class_select/page/view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => Get.off(() => StudentClassSelectView()));

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kHomeColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(Assets.image.splashalaa),
                //SvgPicture.asset("assets/image/spalsh_new.svg")
              )),
              const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "أكبر موقع إلكتروني يحتوي علي المذكرات و الملازم التي تساعد الطالب وأولياء الأمور ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Khebrat Musamim',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
