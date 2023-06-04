import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationState {
  int selectedIndex;
  NavigationState({required this.selectedIndex});
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState(selectedIndex: 0));

  void goTo(int index) => state = NavigationState(selectedIndex: index);
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>(
        (_) => NavigationNotifier());
