import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/empty_ilustrator.svg',
            width: 100.0,
          ),
          Text(
            "No result found!",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
