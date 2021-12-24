part of 'show_subjects_cubit.dart';

@immutable
abstract class ShowSubjectsState {}

class ShowSubjectsInitial extends ShowSubjectsState {}
class ShowSubjectsLoading extends ShowSubjectsState {}
class ShowSubjectsSuccess extends ShowSubjectsState {
  final List <ShowSubjects> showSubjects;

  ShowSubjectsSuccess({required this.showSubjects});
}
class ShowSubjectsError extends ShowSubjectsState {
  final String msg;

  ShowSubjectsError({required this.msg});



}
