// ignore_for_file: use_key_in_widget_constructors

import 'package:almanhaj/screens/banner_details/page/views/ads_spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page/views/content_subject_header.dart';
import 'page/views/subject_description_data.dart';
import 'page/views/subject_download_file.dart';
import '../components/constants.dart';
import '../components/fast_widget.dart';
import '../home_screen/page/views/speed_dial.dart';
import '../home_screen/view.dart';

class BannerDetailsView extends StatefulWidget {
  @override
  State<BannerDetailsView> createState() => _BannerDetailsViewState();
}

class _BannerDetailsViewState extends State<BannerDetailsView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: kBackgroundColor,
        appBar: buildAppBar(context),
        floatingActionButton: FloatingActionView(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: SizedBox(
          height: height,
          width: width,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
                primary: true,
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                physics: const BouncingScrollPhysics(),
                children: [
                  Wrap(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.4,
                        width: width * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: NetworkImage(
                                //   "${snapshot.data['x_featured_media_medium']}"
                                "https://1.bp.blogspot.com/-DXOpLn5BG5s/YSSenl3UxUI/AAAAAAAAr34/8k6H9JU2JoQwKeXU5BxDfEBXjb2TVe2egCNcBGAsYHQ/s2048/2.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const AdsSpaces(),
                      ContentSubjectHeader(),
                      SubjectDescriptionView(
                          // '${snapshot.data['content']['rendered']}'
                          description: test),
                      const AdsSpaces(),
                      const SubjectDownloadFile(
                          /*title: '${snapshot.data['filetitle']}',
                   itemsize: '${snapshot.data['filesize']}',
                   itemtype: '${snapshot.data['filetype']}',
                   itemUrl: '${snapshot.data['fileurl']}',*/
                          fileName:
                              "كتاب امتحان الجغرافيا للصف الثالث الثانوي التيرم الاول 2021",
                          fileSize: "38.81 MB",
                          fileType: "PDF",
                          itemUrl: ""),
                    ],
                  ),
                ]),
          ),
        ));
  }

   adsSpaces(double height, double width) {
    return Container(
      // child: AdmobBanner(
      //   adUnitId: getBannerAdUnitId()!,
      //   adSize: bannerSize!,
      //   listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
      //     handleEvent(event, args, 'Banner');
      //   },
      //   onBannerCreated: (AdmobBannerController controller) {},
      // ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kLightGreenColor.withOpacity(0.2),
      ),
      height: height,
      width: width,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(

      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          Get.off(() => const HomeView());
          //  navigateAndFinish(context,const HomeView());
        },
        child: Image.asset(
          "assets/image/logo2021-2.png",
          width: 130,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
      actions: [

        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
              size: 40,
            ),),
      ],
    );
  }
}
