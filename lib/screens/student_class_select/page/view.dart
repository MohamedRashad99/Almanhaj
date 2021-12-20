import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/customButton.dart';
import 'package:almanhaj/screens/components/default_button.dart';
import 'package:almanhaj/screens/notify_study_timing/view.dart';
import 'package:almanhaj/screens/student_class_select/page/views/bar_description.dart';
import 'package:almanhaj/screens/student_class_select/page/views/class_card.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors
class StudentClassSelectView extends StatefulWidget {
  @override
  _StudentClassSelectViewState createState() => _StudentClassSelectViewState();
}

class _StudentClassSelectViewState extends State<StudentClassSelectView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kHomeColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                BarDescription(
                  "assets/image/logo2021-2.png",
                  "اختر الصفوف التي ترغب في دراستها",
                  "(يمكنك اختيار أكثر من صف )",
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "المرحلة الابتدائيه : ",
                          style: headingStyle.copyWith(
                              color: HexColor("#3080D1"), fontSize: 25),
                        ),
                        CardSection(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                DefaultButton(
                    text: "تأكيد ابدء تصفح المذكرات الان",
                    press: () {
                      Get.offAll(() => NotifyStudyTimingView());

                      /*
                      showMyDialog(
                                context: context,
                                title: "",
                                data: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                    spaceH(20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 60),
                                      child: Image.asset(
                                        "assets/images/select.png",
                                        fit: BoxFit.contain,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "يجب اختيار المرحله التعليمية",
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: headingStyle.copyWith(
                                            color: Colors.red[900],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ));*/
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
