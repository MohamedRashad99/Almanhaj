part of 'card_selection_cubit.dart';

@immutable
abstract class CardSelectionState {}

class CardSelectionInitial extends CardSelectionState {}
class CardSelectionLoading extends CardSelectionState {}
class CardSelectionSuccess extends CardSelectionState {
   final List<Classes> classes ;

  CardSelectionSuccess(this.classes);
}
class CardSelectionError extends CardSelectionState {

  final String mes;

  CardSelectionError(this.mes);

}
