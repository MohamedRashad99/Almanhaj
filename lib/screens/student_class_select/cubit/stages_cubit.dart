import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/student_class_select/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'stages_state.dart';

class StagesCubit extends Cubit<StagesState> {
  StagesCubit() : super(StagesInitial()){
    getStages();
  }

  static StagesCubit of(context) {
    return BlocProvider.of(context);
  }

  List<Stages> stages = [];

  Future<void> getStages() async {
    emit(StagesLoading());
    try {
      final res = await NetWork.get("/categories", queryParams: {
        'parent': '913',
        'per_page': '100',
        'orderby': 'id',
        'order': 'asc',
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        stages.add(Stages.fromJson(element));
      });

      emit(StagesSuccess(stages));

    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(StagesError(e.toString()));
    }
  }
}
