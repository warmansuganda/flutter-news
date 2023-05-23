import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/domain/repositories/news.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletons/skeletons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  bool isLoading = false;
  int page = 0;

  List<News> items = [];

  void getData({bool isRefresh = false}) async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    try {
      int requestPage = isRefresh ? 1 : page + 1;
      final result = await NewsRepository.getNews(requestPage);

      setState(() {
        isLoading = false;
        page = requestPage;
        if (isRefresh) {
          items = result.docs;
        } else {
          items.addAll(result.docs);
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future handleRefresh() async {
    setState(() {
      isLoading = false;
    });

    getData(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RefreshIndicator(
      onRefresh: handleRefresh,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/flutter-logo.svg',
            width: 100,
          ),
          Flexible(
            child: ListView.separated(
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
                              minHeight: MediaQuery.of(context).size.height / 8,
                              maxHeight: MediaQuery.of(context).size.height / 3,
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
    ));
  }
}
