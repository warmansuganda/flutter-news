import 'package:flutter/material.dart';
import 'package:flutter_news/screens/coupon_screen.dart';
import 'package:flutter_news/screens/detail_screen.dart';
import 'package:flutter_news/screens/main_screen.dart';
import 'package:flutter_news/screens/splash_screen.dart';
import 'package:flutter_news/screens/transaction_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        DetailScreen.routeName: (context) => const DetailScreen(),
        TransactionScreen.routeName: (context) => const TransactionScreen(),
        CouponScreen.routeName: (context) => const CouponScreen()
      },
    );
  }
}
