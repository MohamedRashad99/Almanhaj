import 'package:flutter/material.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class SubjectDownloadFile extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String fileType;
  final String itemUrl;
  const SubjectDownloadFile(
      {Key? key,
        required this.fileName,
        required this.fileSize,
        required this.fileType,
        required this.itemUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
     // margin: const EdgeInsets.symmetric(vertical: 8),
      height: height*0.27,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: HexColor("#3080D1")),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: HexColor("#E6EEF7"),
                offset: const Offset(0, 3),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
         // spaceH(10),
          Container(
            height: height*0.05,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: HexColor("#3080D1")),
            child: Center(
              child: Text(
                "معلومات القراءة و التحميل",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(

              children: [
                Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width*0.5,
                      child: buildText( "اسم الملف : $fileName",),
                    ),
                    buildText("حجم الملف : $fileSize", ),
                    buildText("صيغة الملف : $fileType", ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    launch(itemUrl);
                  },
                  child: Container(
                    width: width*0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: HexColor("#F06F9E")),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        const Icon(
                          Icons.cloud_download,
                          color: Colors.white,
                          size: 40,
                        ),
                        spaceH(5),
                        Text(
                          "اضغط هنا",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: headingStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text buildText(String text) {
    return Text(
                     text,
                      textAlign: TextAlign.start,
                      maxLines: 4,
                      textDirection: TextDirection.rtl,
                      style: headingStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    );
  }
}
