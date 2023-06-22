class News {
  final String id;
  final String webUrl;
  final String title;
  final String abstract;
  final double price;
  final String? thumbnail;
  final String? sectionName;
  final bool? isBought;
  final DateTime pubDate;

  News(
      {required this.id,
      required this.webUrl,
      required this.title,
      required this.abstract,
      required this.price,
      this.thumbnail,
      this.sectionName,
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
        abstract: json['abstract'],
        sectionName: json['section_name'],
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
        abstract: json['abstract'],
        price: json['price'],
        sectionName: json['sectionName'],
        thumbnail: json['thumbnail'],
        isBought: json['isBought'],
        pubDate: DateTime.parse(json['pubDate']));
  }

  News copyWith({
    String? id,
    String? webUrl,
    String? title,
    String? abstract,
    double? price,
    String? thumbnail,
    String? sectionName,
    bool? isBought,
    DateTime? pubDate,
  }) {
    return News(
      id: id ?? this.id,
      webUrl: webUrl ?? this.webUrl,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      price: price ?? this.price,
      sectionName: sectionName ?? this.sectionName,
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
      'abstract': abstract,
      'price': price,
      'thumbnail': thumbnail,
      'sectionName': sectionName,
      'isBought': isBought,
      'pubDate': pubDate.toString(),
    };
  }
}
