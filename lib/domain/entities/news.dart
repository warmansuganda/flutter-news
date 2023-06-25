import 'package:flutter_news/domain/entities/author.dart';

class News {
  final String id;
  final String webUrl;
  final String title;
  final String author;
  final List<Author> contributors;
  final String abstract;
  final double price;
  final String? thumbnail;
  final String? sectionName;
  final String? leadParagraph;
  final bool? isBought;
  final DateTime pubDate;

  News(
      {required this.id,
      required this.webUrl,
      required this.title,
      required this.author,
      required this.contributors,
      required this.abstract,
      required this.price,
      this.thumbnail,
      this.sectionName,
      this.leadParagraph,
      this.isBought,
      required this.pubDate});

  static getPrice(DateTime pubDate) {
    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(pubDate);

    if (difference.inDays > 7) {
      // Articles published more than 7 days ago are free
      return 0.0;
    } else if (difference.inDays <= 1) {
      // Articles published in a period less than or equal to 1 day ago
      return 50000.0;
    } else {
      // Articles published in a period less than or equal to 7 days ago
      // but more than 1 day ago
      return 20000.0;
    }
  }

  factory News.fromApi(Map<String, dynamic> json) {
    DateTime pubDate = DateTime.parse(json['pub_date']);
    dynamic thumbnail = json['multimedia']?.firstWhere(
        (element) => element['subtype'] == 'mediumThreeByTwo440',
        orElse: () => null);
    return News(
        id: json['_id'],
        webUrl: json['web_url'],
        title: json['headline']['main'],
        author: json['byline']['original'] ?? '',
        contributors: json['byline']['person'] != null
            ? (json['byline']['person'] as List<dynamic>)
                .map((contributor) => Author.fromApi(contributor))
                .toList()
            : [],
        abstract: json['abstract'],
        sectionName: json['section_name'],
        leadParagraph: json['lead_paragraph'],
        price: getPrice(pubDate),
        thumbnail: thumbnail != null
            ? 'https://static01.nyt.com/${thumbnail['url']}'
            : null,
        isBought: false,
        pubDate: pubDate);
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['id'],
        webUrl: json['webUrl'],
        title: json['title'],
        author: json['author'],
        contributors: json['contributors'] != null
            ? (json['contributors'] as List<dynamic>)
                .map((contributor) => Author.fromJson(contributor))
                .toList()
            : [],
        abstract: json['abstract'],
        price: json['price'],
        sectionName: json['sectionName'],
        thumbnail: json['thumbnail'],
        leadParagraph: json['leadParagraph'],
        isBought: json['isBought'],
        pubDate: DateTime.parse(json['pubDate']));
  }

  News copyWith({
    String? id,
    String? webUrl,
    String? title,
    String? author,
    List<Author>? contributors,
    String? abstract,
    double? price,
    String? thumbnail,
    String? sectionName,
    String? leadParagraph,
    bool? isBought,
    DateTime? pubDate,
  }) {
    return News(
      id: id ?? this.id,
      webUrl: webUrl ?? this.webUrl,
      title: title ?? this.title,
      author: author ?? this.author,
      contributors: contributors ?? this.contributors,
      abstract: abstract ?? this.abstract,
      price: price ?? this.price,
      sectionName: sectionName ?? this.sectionName,
      leadParagraph: leadParagraph ?? this.leadParagraph,
      thumbnail: thumbnail ?? this.thumbnail,
      isBought: isBought ?? this.isBought,
      pubDate: pubDate ?? this.pubDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'webUrl': webUrl,
      'title': title,
      'author': author,
      'contributors': contributors.map((contributor) => contributor.toJson()),
      'abstract': abstract,
      'price': price,
      'thumbnail': thumbnail,
      'sectionName': sectionName,
      'isBought': isBought,
      'pubDate': pubDate.toString(),
    };
  }
}
