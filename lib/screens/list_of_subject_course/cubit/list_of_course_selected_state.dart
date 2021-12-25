part of 'list_of_course_selected_cubit.dart';

@immutable
abstract class ListOfCourseSelectedState {}

class ListOfCourseSelectedInitial extends ListOfCourseSelectedState {}

class ListOfCourseSelectedLoading extends ListOfCourseSelectedState {}

class ListOfCourseSelectedEmpty extends ListOfCourseSelectedState {}

class ListOfCourseSelectedSuccess extends ListOfCourseSelectedState {
  List<ListOfCourseSelected> listOfCourseSelected;

  ListOfCourseSelectedSuccess({required this.listOfCourseSelected});
}

class ListOfCourseSelectedError extends ListOfCourseSelectedState {
  final List<ListOfCourseSelected> listOfCourseSelected;

  ListOfCourseSelectedError({required this.listOfCourseSelected});
}
