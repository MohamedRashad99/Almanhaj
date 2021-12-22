import 'dart:developer';
import 'dart:io';

import '../../../dio_helper/dio.dart';
import '../models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'slider_details_state.dart';

class SliderDetailsCubit extends Cubit<SliderDetailsState> {
   final int? id;

  SliderDetailsCubit({required this.id}) : super(SliderDetailsInitial()) {
    getSliderDetails(id: id!);
  }

  static SliderDetailsCubit of(context) {
    return BlocProvider.of(context);
  }

  SliderDetails? sliderDetails ;

  Future<void> getSliderDetails({required int id}) async {
    emit(SliderDetailsLoading());
    try {
      final res = await NetWork.get('/posts/$id');

      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }

        sliderDetails=SliderDetails.fromJson(res.data);


      emit(SliderDetailsSuccess(sliderDetails!));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(SliderDetailsError(e.toString()));
    }
  }
}
