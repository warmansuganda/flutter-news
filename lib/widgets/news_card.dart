import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.item,
  });

  final News item;

  void handleBuy() {
    // Function to handle the button press
    print('Buy Now pressed!');
    // Add your custom logic here
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                OutlinedButton(
                  onPressed: handleBuy,
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  child: const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6.0,
                    children: [
                      Text(
                        '\$ 50.000',
                      ),
                      Text(
                        '|',
                      ),
                      Text(
                        'Buy Now',
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
