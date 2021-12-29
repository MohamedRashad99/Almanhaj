import 'package:almanhaj/screens/banner_details/view.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/custom_cached_image.dart';
import 'package:almanhaj/screens/components/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardLesson extends StatelessWidget {
  final int id;
  final String title1;
  final String title2;
  final String image;
   const CardLesson({required this.id, required this.title1,required this.title2, required this.image, }) ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
          onTap: () {
           Get.to(()=> BannerDetailsScreen(id: id,));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
           vertical: 5, horizontal: 5),
            height: height * 0.18,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: HexColor("#E6EEF7"),
                      offset: const Offset(0, 3),
                      blurRadius: 3,
                      spreadRadius: 3)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: height * 0.075,
                      width: width * 0.62,
                      decoration: const BoxDecoration(
                        // color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          title1,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: headingStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#323232")),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.075,
                      width: width * 0.62,
                      decoration: const BoxDecoration(
                        // color: Colors.teal,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          parseHtmlString(
                              title2 ,
                          ),
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: headingStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.15,
                  width: width * 0.35,
                  decoration: const BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child:customCachedNetworkImageWitoutTitle(
                      url: image,
                      context: context,
                       fit: BoxFit.contain)
   ),
              ],
            ),
          ),
        );
  }
}
