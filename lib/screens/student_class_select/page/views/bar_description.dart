import 'package:flutter/material.dart';
// ignore: use_key_in_widget_constructors, must_be_immutable
class BarDescription extends StatelessWidget {
  String ? logo;
  String?  title1;
  String?  title2;

   BarDescription(this.logo,this.title1, this.title2, );


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          // color: Colors.red,
          height: height * 0.25,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              // "assets/image/logo2021-2.png"
              Image.asset(
               logo!,
                scale: 4,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              //"اختر الصفوف التي ترغب في دراستها"
               Text(
                title1!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Khebrat Musamim'),
              ),
              //"(يمكنك اختيار أكثر من صف )",
               Text(
                  title2!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Khebrat Musamim',
                      fontWeight: FontWeight.w400,
                      color: Colors.black54)),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }
}
