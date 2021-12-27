
import 'package:almanhaj/config/keys.dart';
import 'package:almanhaj/local_storage/local_storage.dart';
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
  final ValueChanged<Classes> onSelected;

  const CardSection({Key? key, required this.id,required this.onSelected}) : super(key: key);

  @override
  State<CardSection> createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {





  @override
  Widget build(BuildContext context) {
    final map2 = LocalStorage.getMap(KeysConfig.token);
    final List<Classes> selectedClassesList =[];
    map2.forEach((key, value) {
      selectedClassesList.add(Classes(id: int.parse(key), name: value));
    });


    return BlocProvider(
      create: (context) => CardSelectionCubit(id: widget.id),
      child: BlocConsumer<CardSelectionCubit, CardSelectionState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CardSelectionSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.classes.length,
              itemBuilder: (BuildContext context, int index) {
                if(selectedClassesList.isNotEmpty && selectedClassesList.contains(state.classes[index]) ){

                    return ClassItemPressed(classes: state.classes[index],onSelected: widget.onSelected,isPrssed: true,);

                }else {
                  return ClassItemPressed(classes: state.classes[index],onSelected: widget.onSelected,);
                }
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

