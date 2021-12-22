part of 'slider_details_cubit.dart';

@immutable
abstract class SliderDetailsState {}

class SliderDetailsInitial extends SliderDetailsState {}

class SliderDetailsLoading extends SliderDetailsState {}

class SliderDetailsSuccess extends SliderDetailsState {
  final SliderDetails sliderDetails;

  SliderDetailsSuccess(this.sliderDetails);
}

class SliderDetailsError extends SliderDetailsState {
  final String? msg;

  SliderDetailsError(this.msg);
}
