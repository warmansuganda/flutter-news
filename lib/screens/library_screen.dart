import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/widgets/logo.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:skeletons/skeletons.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final controller = ScrollController();
  bool isLoading = false;
  int page = 0;

  List<News> items = [];

  Future handleRefresh() async {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: Column(
          children: [
            Flexible(
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10.0),
                  controller: controller,
                  shrinkWrap: true,
                  itemCount: items.length + 1,
                  separatorBuilder: (context, inde) => const Divider(),
                  itemBuilder: (context, index) {
                    if (index == items.length) {
                      if (isLoading) {
                        return SkeletonItem(
                            child: Column(
                          children: [
                            SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                width: double.infinity,
                                minHeight:
                                    MediaQuery.of(context).size.height / 8,
                                maxHeight:
                                    MediaQuery.of(context).size.height / 3,
                              ),
                            ),
                          ],
                        ));
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      return NewsCard(item: items[index]);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
