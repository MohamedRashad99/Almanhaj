import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/home_screen/page/views/user_section_selected/models/show_subjects_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'show_subjects_state.dart';

class ShowSubjectsCubit extends Cubit<ShowSubjectsState> {

  final int id;

  ShowSubjectsCubit({required this.id}) : super(ShowSubjectsInitial()) {
    getShowSubjects(id: id);
  }

  static ShowSubjectsCubit of(context) {
    return BlocProvider.of(context);
  }

  List <ShowSubjects> showSubjects = [];


  Future<void> getShowSubjects({required int id}) async {
    emit(ShowSubjectsLoading());
    try {
      final res = await NetWork.get("/categories", queryParams: {
        'parent': id,
        'per_page': '100',
        'orderby': 'id',
        'order': 'asc',
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        showSubjects.add(ShowSubjects.fromJson(element));
      });

      emit(ShowSubjectsSuccess(showSubjects: showSubjects));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ShowSubjectsError(msg: e.toString()));
    }
  }
}