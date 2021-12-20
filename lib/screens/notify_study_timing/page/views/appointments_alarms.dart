import 'package:flutter/material.dart';
import '../../../components/constants.dart';

// ignore: use_key_in_widget_constructors
class AppointmentsAlarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.expand_more,
                  color: Colors.black,
                  size: 30,
                ),
                spaceW(10),
                Text(
                  // "${AlarmNotify.get(context).notifyData[index]['day']}",
                  "الخميس",
                  style: headingStyle.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            InkWell(
                onTap: () {
                  // AlarmNotify.get(context).deletaFromDB(
                  //     notifyId: AlarmNotify.get(context)
                  //         .notifyData[index]['id']);
                },
                child: Container(
                  width: 80,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: HexColor("#3080D1").withOpacity(0.1), borderRadius: BorderRadius.circular(15), border: Border.all(color: HexColor("#3080D1"))),
                  child: Center(
                    child: Text(
                      //  "${AlarmNotify.get(context).notifyData[index]['time']}",
                      "5:00",
                      textDirection: TextDirection.ltr,
                      style: headingStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: HexColor("#3080D1")),
                    ),
                  ),
                )),
          ],
        );
      },
      separatorBuilder: (context, index) => spaceH(10),
      itemCount: 8,
    );
  }
}
