class News {
  final String webUrl;
  final String abstract;
  final List<dynamic> multimedia;

  News(
      {required this.webUrl, required this.abstract, required this.multimedia});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      webUrl: json['web_url'],
      abstract: json['abstract'],
      multimedia: json['multimedia'],
    );
  }
}
