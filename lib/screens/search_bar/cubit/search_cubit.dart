import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/search_bar/models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit of(context) {
    return BlocProvider.of(context);
  }
  List <SearchModel> searchModel = [];

  Future<void> getSearchResult({required String words}) async {
    searchModel =[];
    emit(SearchLoading());
    try {
      final res = await NetWork.get("/search", queryParams: {
        'search': words,
        'per_page': '10',
        'page': '1',
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        searchModel.add(SearchModel.fromJson(element));
      });

      if(searchModel.isEmpty){
        emit(SearchIsEmpty());
      }else{
        emit(SearchSuccess(searchModel: searchModel));
      }


    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(SearchError(e.toString()));
    }
  }




}
