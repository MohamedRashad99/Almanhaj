import 'dart:developer';

import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
// ignore: use_key_in_widget_constructors, must_be_immutable
class ClassItemPressed extends StatefulWidget {
   bool isPrssed ;
   final String name ;
   final int id ;

  ClassItemPressed({Key? key, this.isPrssed=false, required this.name, required this.id}) : super(key: key);

  @override
  State<ClassItemPressed> createState() => _ClassItemPressedState();
}

class _ClassItemPressedState extends State<ClassItemPressed> {
  final List<String> selected =[];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        setState(() {
          widget.isPrssed=!widget.isPrssed;
          selected.add(widget.name);
          log(selected.toString());
          log(selected.length.toString());
          LocalStorage.setString('selectedClassesName', widget.name );
          LocalStorage.setInt('selectedClassesId', widget.id );

        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: height*0.1,
        width: width*0.8,
        decoration: BoxDecoration(
            color: widget.isPrssed ? kPrimaryBlueColor.withOpacity(0.3) : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color:widget.isPrssed ?kPrimaryBlueColor : khTextColor,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          Container(
                width: width*0.1,
                height: height *0.05,
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:widget.isPrssed?kPrimaryBlueColor : khTextColor,
                    )),

                child:Container(
                  width: width *0.05,
                  height: height*0.025,
                  decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isPrssed ?kPrimaryBlueColor : Colors.transparent
                  ),
                )

            ),
            spaceW(12),
            Text(
              widget.name,
              style: headingStyle.copyWith(
                  color:  HexColor("#323232"),
                  fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
