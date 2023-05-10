import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  bool isLoading = false;

  List<String> items = [];

  void getData({bool isRefresh = false}) async {
    if (isLoading) return;
    isLoading = true;
    var url = Uri.https('api.nytimes.com', 'svc/search/v2/articlesearch.json', {
      'api-key': 'F81ff4Bj1S6cKDVQCC2XEWXMRaGpzaBA',
      'page': '1',
    });
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      print(jsonResponse['copyright']);
      setState(() {
        isLoading = false;
        if (isRefresh) {
          items = List.generate(15, (index) => 'Item ${index + 1}');
        } else {
          items.addAll(List.generate(15, (index) => 'Item ${index + 1}'));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData(isRefresh: true);
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
            child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
