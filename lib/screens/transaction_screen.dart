import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/empty_state.dart';

class TransactionScreen extends StatelessWidget {
  static const routeName = '/transaction_screen';

  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Transaction",
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue),
        ),
        body: const EmptyState());
  }
}
