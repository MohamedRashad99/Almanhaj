import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/student_class_select/page/card_selection/cubit/card_selection_cubit.dart';
import 'package:flutter/material.dart';


import 'package:almanhaj/screens/student_class_select/page/views/class_item_pressed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: use_key_in_widget_constructors
class CardSection extends StatelessWidget {
  final int id;

  const CardSection({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardSelectionCubit(id: id),
      child: BlocConsumer<CardSelectionCubit, CardSelectionState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CardSelectionSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.classes.length,
              itemBuilder: (BuildContext context, int index) {
                return ClassItemPressed(name: state.classes[index].name!);
              },


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
