import 'package:equatable/equatable.dart';

/*
class Sliders extends Equatable {
  @override
  List<Object?> get props =>
      [
        id, xFeaturedMediaMedium
      ];
  final int? id;
  final String? xFeaturedMediaMedium;

  const Sliders({required this.id, required this.xFeaturedMediaMedium});

  factory Sliders.fromJson(Map<String, dynamic> json) {
    return Sliders(
        id: json["id"], xFeaturedMediaMedium: json["xFeaturedMediaMedium"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {"id": id, "xFeaturedMediaMedium": xFeaturedMediaMedium};
  }


}*/



// ignore: must_be_immutable
class Sliders  extends Equatable{
  int? id;
  String? xFeaturedMediaMedium;
  Title? title;
  @override
  List<Object?> get props => [
    id, xFeaturedMediaMedium , title
  ];

  Sliders({this.id, this.xFeaturedMediaMedium, this.title});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    xFeaturedMediaMedium = json["x_featured_media_medium"];
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["x_featured_media_medium"] = xFeaturedMediaMedium;
    if(title != null) {
      data["title"] = title?.toJson();
    }
    return data;
  }


}

class Title {
  String? rendered;

  Title({this.rendered});

  Title.fromJson(Map<String, dynamic> json) {
    rendered = json["rendered"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rendered"] = rendered;
    return data;
  }
}
