import 'dart:developer';

import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/student_class_select/page/card_selection/cubit/card_selection_cubit.dart';
import 'package:almanhaj/screens/student_class_select/page/card_selection/model/model.dart';
import 'package:flutter/material.dart';


import 'package:almanhaj/screens/student_class_select/page/views/class_item_pressed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: use_key_in_widget_constructors
class CardSection extends StatefulWidget {
  final int id;

  const CardSection({Key? key, required this.id}) : super(key: key);

  @override
  State<CardSection> createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {

  final List<Classes> selecteClasses =[];

  void onSeleted(Classes classes){
    if(selecteClasses.contains(classes)){
      selecteClasses.remove(classes);
    }else{
      selecteClasses.add(classes);
    }
    log(selecteClasses.toString());
    log(selecteClasses.length.toString());
  }



  @override
  Widget build(BuildContext context) {
    final List<String> selected =[];
    return BlocProvider(
      create: (context) => CardSelectionCubit(id: widget.id),
      child: BlocConsumer<CardSelectionCubit, CardSelectionState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CardSelectionSuccess) {
            // return ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: state.classes.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ClassItemPressed(id: state.classes[index].id!,name: state.classes[index].name!);
            //   },
            //
            //
            // );
            return ListView(
              shrinkWrap: true,
              children: state.classes.map((e) {
                return ClassItemPressed(classes: e,onSelected: onSeleted,);
              }).toList(),
            );
          }
          if (state is CardSelectionLoading) {
            return const Center(child: SpinKitChasingDots(
              color: kPrimaryBlueColor,
              size: 15,
            ));
          }
          if (state is CardSelectionError) {
            return Center(child: Text(state.mes));
          }
          return const SizedBox();
        },
      ),
    );
  }
}

// return ListView.builder(
//   shrinkWrap: true,
//   itemCount: state.classes.length,
//   itemBuilder: (BuildContext context, int index) {
//     return ClassItemPressed(id: state.classes[index].id!,name: state.classes[index].name!);
//   },
//
//
// );
