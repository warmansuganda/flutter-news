import 'package:flutter_news/domain/entities/news.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionNotifier extends StateNotifier<List<News>> {
  TransactionNotifier() : super([]);

  void appendNews(News news) {
    state = [...state, news];
  }
}

final navigationProvider =
    StateNotifierProvider<TransactionNotifier, List<News>>(
        (_) => TransactionNotifier());
