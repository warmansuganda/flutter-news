import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/screens/detail_screen.dart';
import 'package:flutter_news/widgets/buy_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsCard extends StatefulHookConsumerWidget {
  final News item;

  const NewsCard({
    super.key,
    required this.item,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsCardState();
}

class _NewsCardState extends ConsumerState<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName);
      },
      child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: widget.item.thumbnail != null
                      ? FadeInImage.assetNetwork(
                          placeholder: 'assets/images/default-image.png',
                          image: widget.item.thumbnail.toString())
                      : Image.asset('assets/images/default-image.png')),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                widget.item.title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 3.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        '•',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        '5h',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  if (widget.item.isBought == true)
                    SizedBox(
                      height: 48.0,
                      child: Row(
                        children: [
                          Text(
                            "\$ 50.000",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const Icon(
                            Icons.bookmark_add,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    )
                  else
                    BuyButton(
                      item: widget.item,
                    ),
                ],
              )
            ],
          )),
    );
  }
}
