import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
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
    );
  }
}
