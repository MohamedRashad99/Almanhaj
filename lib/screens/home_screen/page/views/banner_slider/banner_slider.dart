// ignore_for_file: use_key_in_widget_constructors


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../banner_details/view.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../components/fast_widget.dart';
import 'model/model.dart';

class BannerSlider extends StatelessWidget {
  final List<Sliders> sliders;

  const BannerSlider({Key? key,required this.sliders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      // color: Colors.red,
      color: Colors.white,

      height: height*0.3,
      width: width*0.8,
      child: CarouselSlider.builder(
        itemCount: sliders.length,
        itemBuilder: (context, index, pageViewIndex) {
          return InkWell(
            onTap: () {
              //  interstitialAd.show();

              navigateTo(context, BannerDetailsScreen(id: sliders[index].id,));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: customCachedNetworkImage(
                  context: context,
                  title:
                  sliders[index].title.rendered,
                  url:
                  sliders[index].xFeaturedMediaMedium,
                  fit: BoxFit.cover),
              //   "${snapshot.data[index]['title']['rendered']}",
            ),
          );
        },
        options: CarouselOptions(
          height: 250,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          // reverse: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
