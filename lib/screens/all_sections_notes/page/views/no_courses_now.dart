import 'package:almanhaj/screens/components/constants.dart';
import 'package:flutter/material.dart';
class NoCoursesNow extends StatelessWidget {
  const NoCoursesNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 40, horizontal: 10),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Image.asset(
            "assets/images/3973481.jpg",
            fit: BoxFit.cover,
          ),
          spaceH(15),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "لا توجد مذكرات في الوقت الحالي",
              textAlign: TextAlign.center,
              style: headingStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.red[900]),
            ),
          )
        ],
      ),
    );
  }
}
