import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getData() async {
    var url = Uri.https('api.nytimes.com', 'svc/search/v2/articlesearch.json', {
      'api-key': 'F81ff4Bj1S6cKDVQCC2XEWXMRaGpzaBA',
      'page': '1',
    });
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      print(jsonResponse['copyright']);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('Welcome')),
    );
  }
}
