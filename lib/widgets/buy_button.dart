import 'package:flutter/material.dart';
import 'package:flutter_news/domain/entities/news.dart';
import 'package:flutter_news/providers/transaction/transaction_provider.dart';
import 'package:flutter_news/utils/number_formater.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class BuyButton extends ConsumerWidget {
  final News item;

  const BuyButton({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleBuy() {
      String msg = "You already bought";
      if (item.isBought == null || item.isBought == false) {
        ref.read(transactionProvider.notifier).buy(item);
        msg = "Success";
      }
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
      );
    }

    return OutlinedButton(
      onPressed: handleBuy,
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0))),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 6.0,
        children: [
          Text(
            "\$ ${NumberFormater.currency(item.price)}",
          ),
          const Text(
            '|',
          ),
          const Text(
            'Buy Now',
          ),
        ],
      ),
    );
  }
}
