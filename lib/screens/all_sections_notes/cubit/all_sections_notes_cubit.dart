import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import '../models/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'all_sections_notes_state.dart';

class AllSectionsNotesCubit extends Cubit<AllSectionsNotesState> {
  final int id;
  AllSectionsNotesCubit({required this.id}) : super(AllSectionsNotesInitial()){
    getAllSectionsNotes(id: id);

  }

  static AllSectionsNotesCubit of(context) {
    return BlocProvider.of(context);
  }

  // int _pageNo = 0;
  // bool _canLoadMore = true;
  // bool get canLoadMore => _canLoadMore;
  List <AllSectionSNotes> allSectionSNotes =[];

  //
  // Future<void> refresh() async {
  //   log('refresh()');
  //   _pageNo = 0;
  //   _canLoadMore = true;
  //   allSectionSNotes.clear();
  //   loadMore();
  // }
  Future<void> getAllSectionsNotes({required int id}) async {

    emit(AllSectionsNotesLoading());


    try{
      // if (!_canLoadMore) return;
      // log('now i will load page ${_pageNo + 1}');
      // emit(_pageNo == 0 ? AllSectionsNotesLoading() : AllSectionsNotesLoadingMore(allSectionSNotes));

      final res = await NetWork.get("/posts", queryParams: {
        'categories': '$id',
        'per_page': '10',
        'orderby': 'id',
        'order': 'desc',
        'page': '2',
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        allSectionSNotes.add(AllSectionSNotes.fromJson(element));
      });

      emit(AllSectionsNotesSuccess(allSectionSNotes: allSectionSNotes));


    }catch(e ,es){
      log(e.toString());
      log(es.toString());
      emit(AllSectionsNotesError(msg: e.toString()));
    }
  }
}
