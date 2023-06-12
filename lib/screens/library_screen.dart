import 'package:flutter/material.dart';
import 'package:flutter_news/providers/news/library_provider.dart';
import 'package:flutter_news/widgets/empty_state.dart';
import 'package:flutter_news/widgets/logo.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final library = ref.watch(libraryProvider);

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
      body: library.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.only(top: 10.0),
              controller: controller,
              shrinkWrap: true,
              itemCount: library.length,
              separatorBuilder: (context, inde) => const Divider(),
              itemBuilder: (context, index) {
                return NewsCard(item: library[index]);
              })
          : const EmptyState(),
    );
  }
}
