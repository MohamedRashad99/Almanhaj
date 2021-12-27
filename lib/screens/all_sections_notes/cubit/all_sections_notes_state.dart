part of 'all_sections_notes_cubit.dart';

@immutable
abstract class AllSectionsNotesState {}

class AllSectionsNotesInitial extends AllSectionsNotesState {}

class AllSectionsNotesLoading extends AllSectionsNotesState {}

class AllSectionsNotesLoadingMore extends AllSectionsNotesState {
  final List<AllSectionSNotes> allSectionSNotes;
  AllSectionsNotesLoadingMore(this.allSectionSNotes);
}

class AllSectionsNotesSuccess extends AllSectionsNotesState {
  final List<AllSectionSNotes> allSectionSNotes;

  AllSectionsNotesSuccess({required this.allSectionSNotes});
}
class AllSectionsNotesEmpty extends AllSectionsNotesState {
  final List<AllSectionSNotes> allSectionSNotes;

  AllSectionsNotesEmpty({required this.allSectionSNotes});
}

class AllSectionsNotesError extends AllSectionsNotesState {
  final String msg;

  AllSectionsNotesError({required this.msg});
}
