import 'package:flutter/material.dart';
import 'package:flutter_news/providers/news/news_provider.dart';
import 'package:flutter_news/widgets/empty_state.dart';
import 'package:flutter_news/widgets/logo.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider);
    final items =
        news.items.where((element) => element.isBought == true).toList();

    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 26.0,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.filter_list,
                size: 26.0,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: items.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.only(top: 10.0),
              controller: controller,
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (context, inde) => const Divider(),
              itemBuilder: (context, index) {
                return NewsCard(item: items[index]);
              })
          : const EmptyState(),
    );
  }
}
