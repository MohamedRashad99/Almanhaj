import 'dart:async';

import 'package:almanhaj/config/keys.dart';
import 'package:almanhaj/generated/assets.dart';
import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:almanhaj/screens/home_screen/view.dart';
import 'package:almanhaj/screens/student_class_select/page/card_selection/model/model.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../student_class_select/page/view.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((_){

      final map2 = LocalStorage.getMap(KeysConfig.token);
      final List<Classes> selectedClassesList =[];
      map2.forEach((key, value) {
        selectedClassesList.add(Classes(id: int.parse(key), name: value));
      });
      if(selectedClassesList.isEmpty){
        Get.off(() => StudentClassSelectView());
      }else{
        Get.off(() => const HomeView());
      }
    }
    );

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
