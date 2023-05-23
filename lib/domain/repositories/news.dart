import 'dart:convert';

import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/domain/repositories/repository.dart';
import 'package:http/http.dart';

class NewsRepository {
  static Future<RepositoryResponse<List<News>>> getNews(int page) async {
    final url =
        Uri.https('api.nytimes.com', 'svc/search/v2/articlesearch.json', {
      'api-key': 'F81ff4Bj1S6cKDVQCC2XEWXMRaGpzaBA',
      'page': page.toString(),
    });
    Response response = await get(url);
    Map jsonResponse = jsonDecode(response.body);
    List<News> docs = (jsonResponse['response']['docs'] as List<dynamic>)
        .map((json) => News.fromJson(json))
        .toList();
    MetaReponse meta = MetaReponse();
    return RepositoryResponse(docs: docs, meta: meta);
  }
}
