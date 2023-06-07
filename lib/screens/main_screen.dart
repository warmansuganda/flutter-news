import 'package:flutter/material.dart';
import 'package:flutter_news/providers/main/navigation_provider.dart';
import 'package:flutter_news/screens/account_screen.dart';
import 'package:flutter_news/screens/home_screen.dart';
import 'package:flutter_news/screens/library_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends StatefulHookConsumerWidget {
  static const routeName = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final List<Widget> screens = <Widget>[
    const HomeScreen(),
    const LibraryScreen(),
    const AccountScreen(),
  ];

  final List<BottomNavigationBarItem> navigations = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_library),
      label: 'Library',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = ref.watch(navigationProvider);

    return Scaffold(
      body: IndexedStack(index: nav.selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        items: navigations,
        currentIndex: nav.selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          ref.read(navigationProvider.notifier).goTo(index);
        },
      ),
    );
  }
}
