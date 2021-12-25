import 'package:equatable/equatable.dart';

class Classes extends Equatable {
  @override
  List<Object?> get props => [
    id , name
  ];
  final int id;
  final String name;

  const Classes({required this.id, required this.name});

  factory Classes.fromJson(Map<String, dynamic> json) {
    return Classes(id: json["id"], name: json["name"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {"id": id, 'name': name};
  }
}
