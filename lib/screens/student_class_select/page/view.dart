import 'package:almanhaj/config/keys.dart';
import '../cubit/stages_cubit.dart';
import 'package:flutter/material.dart';
import '../../components/constants.dart';
import '../../components/default_button.dart';
import '../../notify_study_timing/view.dart';
import 'views/bar_description.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'card_selection/class_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// ignore: use_key_in_widget_constructors
class StudentClassSelectView extends StatefulWidget {
  @override
  _StudentClassSelectViewState createState() => _StudentClassSelectViewState();
}

class _StudentClassSelectViewState extends State<StudentClassSelectView> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kHomeColor,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  BarDescription(
                    "assets/image/logo2021-2.png",
                    KeysConfig.selectStage,
                    KeysConfig.selectMore
                  ),
                  BlocConsumer<StagesCubit, StagesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is StagesLoading) {
                        return const Center(
                            child: SpinKitChasingDots(
                          color: kPrimaryBlueColor,
                          size: 40,
                        ));
                      }
                      if (state is StagesSuccess) {
                        return SizedBox(
                          height: height * 0.55,
                          child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.stages.length,
                              itemBuilder: (context, index) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.1),
                                    // color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          state.stages[index].name!,
                                          style: headingStyle.copyWith(
                                              color: HexColor("#3080D1"),
                                              fontSize: 25),
                                        ),
                                        CardSection(
                                            id: state.stages[index].id!),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                      if (state is StagesError) {
                        return Center(child: Text(state.msg));
                      }
                      return const SizedBox();
                    },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  DefaultButton(
                      text: "تأكيد ابدء تصفح المذكرات الان",
                      press: () {
                        Get.offAll(() => NotifyStudyTimingView());

                        /*
                      showMyDialog(
                                context: context,
                                title: "",
                                data: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                    spaceH(20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 60),
                                      child: Image.asset(
                                        "assets/images/select.png",
                                        fit: BoxFit.contain,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        "يجب اختيار المرحله التعليمية",
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: headingStyle.copyWith(
                                            color: Colors.red[900],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ));*/
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
