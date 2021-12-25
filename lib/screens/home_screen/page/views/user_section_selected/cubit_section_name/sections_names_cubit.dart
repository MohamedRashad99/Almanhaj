import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../models/sections_names_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sections_names_state.dart';

class SectionsNamesCubit extends Cubit<SectionsNamesState> {
  final int id;
  SectionsNamesCubit({required this.id}) : super(SectionsNamesInitial()){
    getSectionsNames(id: id);
  }

  static SectionsNamesCubit of(context){
    return BlocProvider.of(context);
  }
  final List <SectionsNames> sectionsNames = [];

    Future<void> getSectionsNames({ required int id})async{
      emit(SectionsNamesLoading());

      try{
        final res = await NetWork.get("/categories", queryParams: {
          'parent': id,
          'per_page': '100',
          'orderby': 'id',
          'order': 'asc',
        });
        if (res.statusCode != HttpStatus.ok) {
          throw res.data;
        }
        for(final element in res.data){
          sectionsNames.add(SectionsNames.fromJson(element));
        }
        log(sectionsNames.toString());
        log(res.data.toString());
        if(sectionsNames.isEmpty){
          emit(SectionsNamesEmpty());
        }else{
          emit(SectionsNamesSuccess(sectionsNames: sectionsNames));
        }




      }catch(e ,es){
        log(e.toString());
        log(es.toString());
        emit(SectionsNamesError(msg: e.toString()));
      }
    }

}
