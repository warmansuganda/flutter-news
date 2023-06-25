import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/utils/datetime_formater.dart';
import 'package:flutter_news/widgets/buy_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScreen extends StatefulHookConsumerWidget {
  static const routeName = '/detail_screen';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                child: item.thumbnail != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/default-image.png',
                        image: item.thumbnail.toString())
                    : Image.asset('assets/images/default-image.png')),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 12,
                              child: Icon(
                                Icons.person,
                                size: 12.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              item.author,
                              style: const TextStyle(fontSize: 12.0),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.grey[600],
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.open_in_new,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      Text(
                        item.sectionName ?? '-',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        '•',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        DateTimeFormater.diffForHumman(item.pubDate),
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(item.abstract),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(item.leadParagraph ?? '')
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          item.isBought != true ? DetailButton(item: item) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class DetailButton extends StatelessWidget {
  const DetailButton({
    super.key,
    required this.item,
  });

  final News item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(top: 150.0),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.0, 1.0],
            colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.2),
              Colors.white,
            ],
          ),
        ),
        child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4.0,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BuyButton(item: item)),
      ),
    );
  }
}
