import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';

// ignore: use_key_in_widget_constructors
class ContentSubjectHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: height*0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceH(10),
              Text(
                // "${snapshot.data['title']['rendered']}",
                "كتاب مادة الجغرافيا للصف الثالث الثانوي التيرم الأول 2021",
                maxLines: 3,
              //  textAlign: TextAlign.start,
                //textDirection: TextDirection.rtl,
                style: headingStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#323232")),
              ),
              spaceH(15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildIcon(Icons.date_range),
                  spaceW(5),
                  dateAndAuthorText(
                    // "${snapshot.data['x_date']}",
                      "ديسمبر 2020,19"
                  ),
                  spaceW(30),
                  buildIcon(Icons.create),
                  spaceW(5),
                  dateAndAuthorText(
                    // "${snapshot.data['x_author']}",
                    "علي علوكة",
                  ),

                ],
              ),
              spaceH(20),
            ],
          ),
        ));
  }

  Icon buildIcon(IconData icon) {
    return Icon(
               // Icons.date_range,
                icon,
                color: HexColor("#666666"),
                size: 20,
              );
  }

  Text dateAndAuthorText(String date) {
    return Text(
                date,
                textDirection: TextDirection.rtl,
                style: headingStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#666666")),
              );
  }
}
