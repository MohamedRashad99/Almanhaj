import 'dart:developer';

import 'package:almanhaj/dio_helper/dio.dart';
import 'package:almanhaj/screens/home_screen/page/views/banner_slider/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial()) {
    getSliders();
  }

  static SliderCubit of(context) {
    return BlocProvider.of(context);
  }

  List<Sliders> sliders = [];

  Future<void> getSliders() async {
    emit(SliderLoading());
    try {
      final res = await NetWork.get('/posts', queryParams: {'per_page': '20'});

      if (res.statusCode != HttpStatus.ok) {
        throw res.data;
      }
      res.data.forEach((element) {
        sliders.add(Sliders.fromJson(element));
      });
      emit(SliderSuccess(sliders));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(SliderError(e.toString()));
    }
  }
}
