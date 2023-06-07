import 'package:flutter/foundation.dart';

class News {
  final String id;
  final String webUrl;
  final String title;
  final String abstract;
  final String? thumbnail;
  final bool? isBought;

  News(
      {required this.id,
      required this.webUrl,
      required this.title,
      required this.abstract,
      this.thumbnail,
      this.isBought});

  factory News.fromJson(Map<String, dynamic> json) {
    dynamic thumbnail = json['multimedia']?.firstWhere(
        (element) => element['subtype'] == 'mediumThreeByTwo440',
        orElse: () => null);
    return News(
        id: json['_id'],
        webUrl: json['web_url'],
        title: json['headline']['main'],
        abstract: json['abstract'],
        thumbnail: thumbnail != null
            ? 'https://static01.nyt.com/${thumbnail['url']}'
            : null,
        isBought: false);
  }

  News copyWith({
    String? id,
    String? webUrl,
    String? title,
    String? abstract,
    String? thumbnail,
    bool? isBought,
  }) {
    return News(
      id: id ?? this.id,
      webUrl: webUrl ?? this.webUrl,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      thumbnail: thumbnail ?? this.thumbnail,
      isBought: isBought ?? this.isBought,
    );
  }
}
