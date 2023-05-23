class News {
  final String webUrl;
  final String title;
  final String abstract;
  final String? thumbnail;

  News(
      {required this.webUrl,
      required this.title,
      required this.abstract,
      this.thumbnail});

  factory News.fromJson(Map<String, dynamic> json) {
    dynamic thumbnail = json['multimedia']?.firstWhere(
        (element) => element['subtype'] == 'mediumThreeByTwo440',
        orElse: () => null);
    return News(
      webUrl: json['web_url'],
      title: json['headline']['main'],
      abstract: json['abstract'],
      thumbnail: thumbnail != null
          ? 'https://static01.nyt.com/${thumbnail['url']}'
          : null,
    );
  }
}
