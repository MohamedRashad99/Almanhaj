import 'dart:developer';
import 'dart:io';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/student_class_select/page/card_selection/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'card_selection_state.dart';

class CardSelectionCubit extends Cubit<CardSelectionState> {
  final int id;
  CardSelectionCubit({required this.id}) : super(CardSelectionInitial()){
    getClasses(id: id);
  }

  static CardSelectionCubit of(context) {
    return BlocProvider.of(context);
  }

  List<Classes> classes = [];

  Future <void> getClasses({ required int id}) async {
    emit(CardSelectionLoading());
    try {
      final res = await NetWork.get("/categories", queryParams: {
        'parent': '$id',
        'per_page': '100',
        'orderby': 'id',
        'order': 'asc',
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        classes.add(Classes.fromJson(element));
      });

      emit(CardSelectionSuccess(
        classes
      ));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(CardSelectionError(e.toString()));
    }
  }

}


