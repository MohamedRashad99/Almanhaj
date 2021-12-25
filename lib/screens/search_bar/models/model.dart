import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  @override
  List<Object?> get props => [
    id , title
  ];
  final int id;
  final String title;

  const SearchModel({required this.id, required this.title});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(id: json["id"], title: json["title"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {"id": id, 'name': title};
  }
}