import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllSectionSNotes extends Equatable {
  final int id;
  final String xFeaturedMediaMedium;
  final Title title;
  final Content content;
  final String xDate;
  final String xAuthor;
  final String filesize;
  final String filetitle;
  final String filetype;
  final String fileurl;

  const AllSectionSNotes(
      {required this.id,
        required this.xFeaturedMediaMedium,
        required this.title,
        required this.content,
        required this.xDate,
        required this.xAuthor,
        required this.filesize,
        required this.filetitle,
        required this.filetype,
        required this.fileurl});

  @override
  List<Object?> get props => [
    id,
    xFeaturedMediaMedium,
    title,
    content,
    xDate,
    xAuthor,
    filesize,
    filetitle,
    filetype,
    fileurl
  ];

  factory AllSectionSNotes.fromJson(Map<String, dynamic> json) {
    return AllSectionSNotes(
        id: json["id"],
        xFeaturedMediaMedium: json["x_featured_media_medium"],
        title: Title.fromjson(json["title"]),
        content: Content.fromjson(json["content"]),
        xDate: json["x_date"],
        xAuthor: json["x_author"],
        filesize: json["filesize"],
        filetitle: json["filetitle"],
        filetype: json["filetype"],
        fileurl: json["fileurl"]);
  }

  Future<Map<String, dynamic>> toMap() async {
    return {
      "id": id,
      "x_featured_media_medium": xFeaturedMediaMedium,
      "title": title,
      "content": content,
      "x_date": xDate,
      "x_author": xAuthor,
      "filesize": filesize,
      "filetitle": filetitle,
      "filetype": filetype,
      "fileurl": fileurl
    };
  }
}

class Title extends Equatable {
  final String rendered;

  const Title({required this.rendered});

  @override
  List<Object?> get props => [rendered];

  factory Title.fromjson(Map<String, dynamic> json) {
    return Title(rendered: json["rendered"]);
  }
}

class Content extends Equatable {
  final String rendered;

  const Content({required this.rendered});

  @override
  List<Object?> get props => [rendered];

  factory Content.fromjson(Map<String, dynamic> json) {
    return Content(rendered: json["rendered"]);
  }
}