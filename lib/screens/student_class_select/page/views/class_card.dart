import 'package:flutter/material.dart';


import 'package:almanhaj/screens/student_class_select/page/views/class_item_pressed.dart';
// ignore: use_key_in_widget_constructors
class CardSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context ,int index){
        return  ClassItemPressed();
      },


    );
  }
}
