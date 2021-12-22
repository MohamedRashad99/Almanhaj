// ignore_for_file: use_key_in_widget_constructors

import 'package:almanhaj/generated/assets.dart';

import '../../../../components/constants.dart';
import 'cubit/slider_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../banner_details/view.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../components/fast_widget.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SliderCubit, SliderState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is  SliderLoading){
          return const Center(
              child: SpinKitChasingDots(
                color: kPrimaryBlueColor,
                size: 40,
              ));
        }
        if (state is SliderSuccess){
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            // color: Colors.red,
            color: Colors.white,

            height: height*0.3,
            width: width*0.8,
            child: CarouselSlider.builder(
              itemCount: state.sliders.length,
              itemBuilder: (context, index, pageViewIndex) {
                return InkWell(
                  onTap: () {
                    //  interstitialAd.show();
                    // TODO :: Im passed id of slider selected here to get more details
                    navigateTo(context, BannerDetailsView(id: state.sliders[index].id,));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: customCachedNetworkImage(
                        context: context,
                        title:
                        "${state.sliders[index].title?.rendered}",
                        url:
                        "${state.sliders[index].xFeaturedMediaMedium}",
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
        if (state is SliderError){
          return Center(child: Image.asset(Assets.image.logo2021));
        }
        return const SizedBox();

      },
    );
  }
}
