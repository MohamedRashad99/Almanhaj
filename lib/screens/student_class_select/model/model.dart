import 'package:equatable/equatable.dart';

// class AllStages extends Equatable{
//   @override
//   List<Object?> get props => [
//     stages
//   ];
//
//    final Stages stages ;
//
//   const AllStages({required this.stages });
//
//   factory AllStages.fromJson(Map<String, dynamic> json) {
//     return AllStages(
//         stages: json[''],
//     );
//   }
//
// }
class Stages extends Equatable {
  @override
  List<Object?> get props => [
    id , name
  ];
  final int? id;
  final String? name;

  const Stages({required this.id, required this.name});

  factory Stages.fromJson(Map<String, dynamic> json) {
    return Stages(id: json["id"], name: json["name"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {"id": id, 'name': name};
  }
}
