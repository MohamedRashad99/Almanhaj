import 'package:almanhaj/screens/components/constants.dart';
import 'package:flutter/material.dart';
class AdsSpaces extends StatelessWidget {



  const AdsSpaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
      height: height * 0.08,
      width: width *0.9,
    );
  }
}
