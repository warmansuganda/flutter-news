import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/domain/repositories/news_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsState {
  final bool isLoading;
  final int page;
  final List<News> items;

  NewsState({
    required this.isLoading,
    required this.page,
    required this.items,
  });

  factory NewsState.initial() {
    return NewsState(
      isLoading: false,
      page: 0,
      items: [],
    );
  }

  NewsState copyWith({
    bool? isLoading,
    int? page,
    List<News>? items,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      items: items ?? this.items,
    );
  }
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState.initial());

  Future<void> getData({bool isRefresh = false}) async {
    if (state.isLoading) return;
    Future(() {
      state = state.copyWith(isLoading: true);
    });
    try {
      int requestPage = isRefresh ? 1 : state.page + 1;
      final result = await NewsRepository.getNews(requestPage);
      Future(() {
        state = state.copyWith(
            isLoading: false,
            page: requestPage,
            items: isRefresh ? result.docs : [...state.items, ...result.docs]);
      });
    } catch (e) {
      Future(() {
        state = state.copyWith(isLoading: false);
      });
    }
  }

  void buy(News item) {
    List<News> items = [...state.items];
    int index = state.items.indexWhere((element) => element.id == item.id);
    items[index] = items[index].copyWith(isBought: true);
    state = state.copyWith(items: items);
  }
}

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((_) => NewsNotifier());
