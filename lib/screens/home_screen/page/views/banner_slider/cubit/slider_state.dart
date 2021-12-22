part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}
class SliderLoading extends SliderState {}
class SliderSuccess extends SliderState {
  final List<Sliders>sliders ;
  SliderSuccess(this.sliders);
}
class SliderError extends SliderState {
  final String? msg ;

  SliderError(this.msg);

}
