import 'dart:developer';
import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/list_of_subject_course/models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'list_of_course_selected_state.dart';

class ListOfCourseSelectedCubit extends Cubit<ListOfCourseSelectedState> {
  final int id ;
  ListOfCourseSelectedCubit({required this.id}) : super(ListOfCourseSelectedInitial()){
    getListOfCourseSelected(id: id);
  }
  static ListOfCourseSelectedCubit of(context) {
    return BlocProvider.of(context);
  }

    List<ListOfCourseSelected> listOfCourseSelected =[];
  Future<void> getListOfCourseSelected({required int id}) async {

    emit(ListOfCourseSelectedLoading());
    try {
      final res = await NetWork.get("/posts", queryParams: {
        'categories': '$id',
        'per_page': '10',
        'orderby': 'id',
        'order': 'desc',
        'page': 1
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        listOfCourseSelected.add(ListOfCourseSelected.fromJson(element));
      });

      if(listOfCourseSelected.isEmpty){
        emit(ListOfCourseSelectedEmpty());
      }else{
        emit(ListOfCourseSelectedSuccess(listOfCourseSelected: listOfCourseSelected));
      }


    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ListOfCourseSelectedError(listOfCourseSelected: listOfCourseSelected));
    }
  }
}
