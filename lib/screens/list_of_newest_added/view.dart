// ignore_for_file: use_key_in_widget_constructors

import 'package:almanhaj/generated/assets.dart';
import 'package:almanhaj/screens/home_screen/page/views/banner_slider/cubit/slider_cubit.dart';
import 'package:almanhaj/screens/home_screen/page/views/banner_slider/model/model.dart';
import 'package:almanhaj/screens/list_of_newest_added/cubit/list_of_newesr_add_cubit.dart';
import 'package:almanhaj/screens/list_of_selected_course/page/views/lesson_of_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'page/views/subject_header.dart';
import '../components/constants.dart';
import '../components/fast_widget.dart';
import '../home_screen/page/views/menue_items.dart';
import '../home_screen/page/views/speed_dial.dart';
import '../home_screen/view.dart';

class ListOfNewestAdded extends StatefulWidget {
  // final List<Sliders> sliders;
  // final bool loadMore;

  const ListOfNewestAdded();

  @override
  State<ListOfNewestAdded> createState() => _ListOfSelectedCourseState();
}

class _ListOfSelectedCourseState extends State<ListOfNewestAdded> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: customAppBar(
          context: context,
          press: () => scaffoldKey.currentState!.openEndDrawer()),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: MenueItems(),
      body: BlocProvider(
        create: (context) => ListOfNewestAddCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: SubjectHeader(),
              height: height * 0.075,
            ),
            Expanded(
              child: BlocConsumer<ListOfNewestAddCubit, ListOfNewestAddState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = ListOfNewestAddCubit.of(context);
                  if (state is ListOfNewestAddLoading) {
                    return const Center(
                        child: SpinKitChasingDots(
                      color: kPrimaryBlueColor,
                      size: 40,
                    ));
                  }
                  if (state is ListOfNewestAddLoadMore) {
                    const bool loadMore = true;
                    return RefreshIndicator(
                      onRefresh: cubit.refresh,
                      child: ListView.builder(
                        itemCount: state.listOfNewestAddModel.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          final isLastItem =
                              state.listOfNewestAddModel.length == index + 1;
                          if (isLastItem && cubit.canLoadMore && !loadMore) {
                            cubit.getSliders();
                          }
                          if (isLastItem && cubit.canLoadMore && loadMore) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CardLesson(
                                  id: state.listOfNewestAddModel[index].id,
                                  title1: state.listOfNewestAddModel[index]
                                      .title.rendered,
                                  title2: state.listOfNewestAddModel[index]
                                      .content.rendered,
                                  image: state.listOfNewestAddModel[index]
                                      .xFeaturedMediaMedium,
                                ),
                                const Center(
                                    child: SpinKitChasingDots(
                                  color: kPrimaryBlueColor,
                                  size: 40,
                                ))
                              ],
                            );
                          } else {
                            return CardLesson(
                              id: state.listOfNewestAddModel[index].id,
                              title1: state
                                  .listOfNewestAddModel[index].title.rendered,
                              title2: state
                                  .listOfNewestAddModel[index].content.rendered,
                              image: state.listOfNewestAddModel[index]
                                  .xFeaturedMediaMedium,
                            );
                          }
                        },
                      ),
                    );
                  }
                  if (state is ListOfNewestAddSuccess) {
                    const bool loadMore = false;
                    return RefreshIndicator(
                      onRefresh: cubit.refresh,
                      child: ListView.builder(
                        itemCount: state.listOfNewestAddModel.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          final isLastItem =
                              state.listOfNewestAddModel.length == index + 1;
                          if (isLastItem && cubit.canLoadMore && !loadMore) {
                            cubit.getSliders();
                          }
                          if (isLastItem && cubit.canLoadMore && loadMore) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CardLesson(
                                  id: state.listOfNewestAddModel[index].id,
                                  title1: state.listOfNewestAddModel[index]
                                      .title.rendered,
                                  title2: state.listOfNewestAddModel[index]
                                      .content.rendered,
                                  image: state.listOfNewestAddModel[index]
                                      .xFeaturedMediaMedium,
                                ),
                                const Center(
                                    child: SpinKitChasingDots(
                                  color: kPrimaryBlueColor,
                                  size: 40,
                                ))
                              ],
                            );
                          } else {
                            return CardLesson(
                              id: state.listOfNewestAddModel[index].id,
                              title1: state
                                  .listOfNewestAddModel[index].title.rendered,
                              title2: state
                                  .listOfNewestAddModel[index].content.rendered,
                              image: state.listOfNewestAddModel[index]
                                  .xFeaturedMediaMedium,
                            );
                          }
                        },
                      ),
                    );
                  }
                  if (state is ListOfNewestAddError) {
                    return Center(child: Image.asset(Assets.image.logo2021));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  customAppBar({required BuildContext context, required VoidCallback press}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          navigateAndFinish(context, const HomeView());
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
            onPressed: press,
            icon: const Icon(
              Icons.format_align_justify,
              color: Colors.black,
              size: 30,
            )),
      ],
    );
  }
}
