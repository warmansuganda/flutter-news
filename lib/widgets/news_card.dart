import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.item,
  });

  final News item;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: item.thumbnail != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/default-image.png',
                        image: item.thumbnail.toString())
                    : Image.asset('assets/images/default-image.png')),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              item.title,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 3.0)
          ],
        ));
  }
}
