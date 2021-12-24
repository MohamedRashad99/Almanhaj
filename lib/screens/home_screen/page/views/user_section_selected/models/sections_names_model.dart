import 'package:equatable/equatable.dart';

class SectionsNames extends Equatable {
  @override
  List<Object?> get props => [
    id , name
  ];
  final int id;
  final String name;

  const SectionsNames({required this.id, required this.name});

  factory SectionsNames.fromJson(Map<String, dynamic> json) {
    return SectionsNames(id: json["id"], name: json["name"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {"id": id, 'name': name};
  }
}