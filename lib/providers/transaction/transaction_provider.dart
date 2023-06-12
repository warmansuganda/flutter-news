import 'package:flutter/foundation.dart';
import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/providers/news/library_provider.dart';
import 'package:flutter_news/providers/news/news_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionNotifier extends ChangeNotifier {
  final ChangeNotifierProviderRef<TransactionNotifier> ref;

  TransactionNotifier(this.ref);

  void buy(News item) {
    News result = ref.read(newsProvider.notifier).bought(item);
    ref.read(libraryProvider.notifier).save(result);
  }
}

final transactionProvider = ChangeNotifierProvider<TransactionNotifier>(
    (ref) => TransactionNotifier(ref));
