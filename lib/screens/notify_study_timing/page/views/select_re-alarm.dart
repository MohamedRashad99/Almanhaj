// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../../../components/smallButton.dart';

import 'date_time_list.dart';

// ignore: use_key_in_widget_constructors
class SelectRealarm extends StatefulWidget {
  @override
  State<SelectRealarm> createState() => _SelectRealarmState();
}

class _SelectRealarmState extends State<SelectRealarm> {
  DateTimeList dateTimeList = DateTimeList();
  String? val1;
  String? val2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dayOrClock("اليوم"),
          InkWell(
            onTap: () => _showPopupMenuDay(),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: width * 0.6,
              height: height * 0.079,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: HexColor("#F1F1F1"),
              ),
              child: DropdownButton<String>(
                onTap: (){},
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
               underline: const SizedBox.shrink(),
                items: dateTimeList.daysList.map((e) => DropdownMenuItem<String>(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(e,style:const TextStyle(color:Colors.black)),
                  ),
                  value: e,
                )).toList(),
                value: val1,
                dropdownColor: Colors.white,
                hint:  Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text('اختار اليوم',
                      style: headingStyle.copyWith(
                      color: kGreyTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                style: headingStyle.copyWith(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                onChanged: (e)=> setState(()=>val1=e),

              ),
            ),
          ),
          dayOrClock("الساعه"),
          InkWell(
            onTap: () => _showPopupMenuDate(),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: width * 0.6,
              height: height * 0.079,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: HexColor("#F1F1F1"),
              ),
              child: DropdownButton<String>(
                onTap: (){},
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                underline: const SizedBox.shrink(),
                items: dateTimeList.timeList5.map((e) => DropdownMenuItem<String>(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(e,style:const TextStyle(color:Colors.black),),
                  ),
                  value: e,
                )).toList(),
                value: val2,
                dropdownColor: Colors.white,
                hint:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('اختار الساعه',
                    style: headingStyle.copyWith(
                        color: kGreyTextColor, fontSize: 14, fontWeight: FontWeight.bold),

                  ),
                ),
                style: headingStyle.copyWith(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                onChanged: (e)=> setState(()=>val2=e),
              ),
            ),
          ),
          spaceH(20),
          Center(
              child: SmallButton(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'إضافة',
            color: kPrimaryColor,
          ))
        ],
      ),
    );
  }

  Text dayOrClock(String typeNotify) {
    return Text(
      typeNotify,
      style: headingStyle.copyWith(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  void _showPopupMenuDate() async {
    await showMenu(
      color: Colors.white,
      context: context,
      position: const RelativeRect.fromLTRB(85, 320, 100, 200),
      items: dateTimeList.timeList5.map((String choice) {
        return PopupMenuItem(
          value: choice,
          child: InkWell(
            onTap: () {
              // AppCubite.get(context).changetime(updatedTime: choice.toString());
              Navigator.pop(context);
            },
            child: Text(
              choice,
              style: headingStyle.copyWith(
                // color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),

            ),
          ),
        );
      }).toList(),
      elevation: 8.0,
    );
  }

  void _showPopupMenuDay() async {
    await showMenu(
      color: Colors.white,
      context: context,
      position: const RelativeRect.fromLTRB(85, 240, 100, 200),
      items: dateTimeList.daysList.map((String choice) {
        return PopupMenuItem(
          value: choice,
          child: InkWell(
            onTap: () {
              // AppCubite.get(context).changeday(updatedDay: choice.toString());
              Navigator.pop(context);
            },
            child: Text(
              choice,
              style: headingStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
      elevation: 8.0,
    );
  }
}
