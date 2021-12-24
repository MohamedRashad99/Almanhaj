import 'package:equatable/equatable.dart';

class ShowSubjects extends Equatable {
  @override
  List<Object?> get props => [
    id , name
  ];
  final int? id;
  final String? name;

  const ShowSubjects({required this.id, required this.name});

  factory ShowSubjects.fromJson(Map<String, dynamic> json) {
    return ShowSubjects(id: json["id"], name: json["name"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {"id": id, 'name': name};
  }
}