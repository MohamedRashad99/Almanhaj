import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:almanhaj/screens/home_screen/view.dart';
import 'package:get/get.dart';
import 'page/views/appointments_alarms.dart';
import 'package:almanhaj/screens/student_class_select/page/views/bar_description.dart';

import 'page/views/select_re-alarm.dart';

// ignore: use_key_in_widget_constructors
class NotifyStudyTimingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: kHomeColor,
            body: ListView(
              children: [
                SizedBox(
                    height: height,
                    width: width,
                    child: Column(children: [
                      BarDescription(
                        "assets/image/logo2021-2.png",
                        "اختر توقيت المذاكرة الملائم لك",
                        "(تساعدك التنبيهات على إدارة وقت المذاكرة الخاص بك )",
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: height * 0.55,
                        width: width,
                        child: AppointmentsAlarms(),
                      ),

                      SizedBox(
                        width: width * 0.9,
                        height: height * 0.079,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          color: HexColor("#3080D1"),
                          onPressed: () {
                            final date= DateTime.utc(2021,1,1,1,0,0,0,0);
                            // first get current date DateTime.now()


                            showMyDialog(
                                context: context,
                                title: '',
                                data: SelectRealarm());
                          },
                          child: Row(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              spaceW(10),
                              const Text(
                                "اضف وقت جديد للتنبيه",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Khebrat Musamim',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: () async {

                            Get.offAll(() => const HomeView());

                          },
                          child: Text(
                            "تخطي",
                            style: headingStyle.copyWith(
                                color: kGreyTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ])),
              ],
            )));
  }
}
class DaysWithId{
 final String day;
 final int id;
  DaysWithId({ required this.day,required this.id});


}
