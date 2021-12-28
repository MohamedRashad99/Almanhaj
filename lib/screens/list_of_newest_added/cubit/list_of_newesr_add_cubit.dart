import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/list_of_newest_added/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'list_of_newesr_add_state.dart';

class ListOfNewestAddCubit extends Cubit<ListOfNewestAddState> {
  ListOfNewestAddCubit() : super(ListOfNewestAddInitial()){
    refresh();
  }

static ListOfNewestAddCubit of(context){
  return BlocProvider.of(context);
}


  int _pageNo = 1;
  bool _canLoadMore = true;
  bool _hasNextPage = true;
  bool get canLoadMore => _hasNextPage;
  List<ListOfNewestAddModel> slidersList = [];
  Future<void> refresh() async {
    log('refresh()');
    _pageNo = 1;
    _canLoadMore = true;
    slidersList.clear();
    getSliders();
  }

  Future<void> getSliders() async {
    if (!_canLoadMore) return;
    try {
      log('now i will load page ${_pageNo + 1}');
      emit(_pageNo == 0 ? ListOfNewestAddLoading() : ListOfNewestAddLoadMore(listOfNewestAddModel:slidersList ));
      final res = await NetWork.get('/posts', queryParams: {
        'per_page': '10',
        'page': ++_pageNo,

      });

      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        slidersList.add(ListOfNewestAddModel.fromJson(element));
      });
      if(res.data.isEmpty){
        _hasNextPage = false;
      }
      emit(ListOfNewestAddSuccess(listOfNewestAddModel: slidersList  ));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(ListOfNewestAddError(e.toString()));
    }
  }
}
