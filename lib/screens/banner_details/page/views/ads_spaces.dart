import 'package:almanhaj/screens/components/constants.dart';
import 'package:flutter/material.dart';
class AdsSpaces extends StatelessWidget {

 final Widget widget ;

  const AdsSpaces({Key? key, required this.widget}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kLightGreenColor.withOpacity(0.2),
      ),
      height: height * 0.08,
      width: width *0.9,
    );
  }
}
