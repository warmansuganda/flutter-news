import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news/widgets/buy_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScreen extends HookConsumerWidget {
  static const routeName = '/detail_screen';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);

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
            Text("Count ${count.value}"),
            OutlinedButton(
                onPressed: () {
                  count.value++;
                },
                child: const Text("test"))
          ],
        ),
      ),
      floatingActionButton: const BuyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
