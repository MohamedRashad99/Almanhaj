import 'package:equatable/equatable.dart';

class Sliders extends Equatable {
  final int id;
  final String xFeaturedMediaMedium;
  final Title title;
  final Content content;

  @override
  List<Object?> get props => [id, xFeaturedMediaMedium, title, content];

  const Sliders(
      {required this.id,
      required this.xFeaturedMediaMedium,
      required this.title,
      required this.content});

  factory Sliders.fromJson(Map<String, dynamic> json) {
    return Sliders(
        id: json["id"],
        xFeaturedMediaMedium: json["x_featured_media_medium"],
        title: Title.fromJson(json["title"]),
        content: Content.fromJson(json["content"]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["x_featured_media_medium"] = xFeaturedMediaMedium;
    if (title != null) {
      data["title"] = title.toJson();
    }
    if (content != null) {
      data["content"] = content.toJson();
    }
    return data;
  }
}

class Title {
  final String rendered;

  Title({required this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(rendered: json["rendered"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rendered"] = rendered;
    return data;
  }
}

class Content {
  final String rendered;

  Content({required this.rendered});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(rendered: json["rendered"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rendered"] = rendered;
    return data;
  }
}
