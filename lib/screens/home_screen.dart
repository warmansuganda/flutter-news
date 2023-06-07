import 'package:flutter/material.dart';
import 'package:flutter_news/providers/news/news_provider.dart';
import 'package:flutter_news/widgets/logo.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:flutter_news/widgets/news_skeleton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final controller = ScrollController();

  Future<void> getData({bool isRefresh = false}) async {
    await ref.read(newsProvider.notifier).getData(isRefresh: isRefresh);
  }

  Future handleRefresh() async {
    getData(isRefresh: true);
  }

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
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
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView.separated(
            padding: const EdgeInsets.only(top: 10.0),
            controller: controller,
            shrinkWrap: true,
            itemCount: news.items.length + 1,
            separatorBuilder: (context, inde) => const Divider(),
            itemBuilder: (context, index) {
              if (index == news.items.length) {
                if (news.isLoading) {
                  return const Column(
                    children: [
                      NewsSkeleton(),
                      Divider(),
                      NewsSkeleton(),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              } else {
                return NewsCard(item: news.items[index]);
              }
            }),
      ),
    );
  }
}
