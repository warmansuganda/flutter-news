import 'dart:convert';

import 'package:flutter_news/domain/entities/news.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryNotifier extends StateNotifier<List<News>> {
  late SharedPreferences sharedPreferences;

  Future _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var library = sharedPreferences.getStringList("library");
    state = library != null
        ? library.map((news) => News.fromJson(jsonDecode(news))).toList()
        : [];
  }

  LibraryNotifier() : super([]) {
    _init();
  }

  void save(News news) {
    state = [...state, news];
    sharedPreferences.setStringList(
        'library', state.map((news) => jsonEncode(news.toJson())).toList());
  }

  void reset() {
    state = [];
    sharedPreferences.remove('library');
  }
}

final libraryProvider = StateNotifierProvider<LibraryNotifier, List<News>>(
    (_) => LibraryNotifier());
