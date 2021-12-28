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
    refresh(id: id);

  }

  static AllSectionsNotesCubit of(context) {
    return BlocProvider.of(context);
  }

  int _pageNo = 1;
  bool _canLoadMore = true;
  bool _hasNextPage = true;
  bool get canLoadMore => _hasNextPage;
  List <AllSectionSNotes> allSectionSNotes =[];



  Future<void> refresh({required int id}) async {
    log('refresh()');
    _pageNo = 1;
    _canLoadMore = true;
    allSectionSNotes.clear();
    getAllSectionsNotes(id: id);
  }
  Future<void> getAllSectionsNotes({required int id}) async {
    if (!_canLoadMore) return;
    try{
      log('now i will load page ${_pageNo + 1}');
      emit(_pageNo == 0 ? AllSectionsNotesLoading() : AllSectionsNotesLoadingMore(allSectionSNotes));

      final res = await NetWork.get("/posts", queryParams: {
        'categories': '$id',
        'per_page': '10',
        'orderby': 'id',
        'order': 'desc',
        'page': ++_pageNo,
      });
      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        allSectionSNotes.add(AllSectionSNotes.fromJson(element));
      });
      if(res.data.isEmpty){
        _hasNextPage = false;
      }
      emit(AllSectionsNotesSuccess(allSectionSNotes: allSectionSNotes));


    }catch(e ,es){
      log(e.toString());
      log(es.toString());
      emit(AllSectionsNotesError(msg: e.toString()));
    }
  }
}



// int _page = 1;
//
// // There is next page or not
// bool _hasNextPage = true;
//
// // Used to display loading indicators when _firstLoad function is running
// bool _isFirstLoadRunning = false;
//
// // Used to display loading indicators when _loadMore function is running
// bool _isLoadMoreRunning = false;
//
// // This holds the posts fetched from the server
// List _posts = [];
//
// // This function will be called when the app launches (see the initState function)
// void _firstLoad() async {
//   print(
//       "------------------------------------------------ ${widget.sectionId}");
//   setState(() {
//     _isFirstLoadRunning = true;
//   });
//   try {
//     final res = await http.get(Uri.parse(EndPoints.BASEURL +
//         "/posts?categories=${widget.sectionId}&per_page=10&orderby=id&order=desc&page=$_page"));
//     var finalRes = json.decode(res.body);
//     setState(() {
//       _posts = finalRes;
//     });
//   } catch (err) {}
//
//   setState(() {
//     _isFirstLoadRunning = false;
//   });
// }
//
// // This function will be triggered whenver the user scroll
// // to near the bottom of the list view
// void _loadMore() async {
//   if (_hasNextPage == true &&
//       _isFirstLoadRunning == false &&
//       _isLoadMoreRunning == false &&
//       _controller.position.extentAfter < 100) {
//     setState(() {
//       _isLoadMoreRunning = true; // Display a progress indicator at the bottom
//     });
//     _page += 1; // Increase _page by 1
//     try {
//       final res = await http.get(Uri.parse(EndPoints.BASEURL +
//           "/posts?categories=${widget.sectionId}&per_page=10&orderby=id&order=desc&page=$_page"));
//
//       var response = json.decode(res.body);
//
//       if (response.length > 0) {
//         setState(() {
//           _posts.addAll(response);
//         });
//       } else {
//         // This means there is no more data
//         // and therefore, we will not send another GET request
//         setState(() {
//
//         });
//       }
//     } catch (err) {}
//
//     setState(() {
//       _isLoadMoreRunning = false;
//     });
//   }
// }
