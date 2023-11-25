// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, NavigationState>((ref) {
  return NavigationNotifier();
});

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier(): super(NavigationState());
  
  void changeIndex(int index) {
    state = state.copyWith(
      currentIndex: index
    );
  }

  void changeShow(bool show) {
    state = state.copyWith(
      show: show
    );
  }

}

class NavigationState {
  final int currentIndex;
  final bool show;

  NavigationState({this.currentIndex = 0, this.show = true});

  NavigationState copyWith({
    int? currentIndex,
    bool? show,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      show: show ?? this.show,
    );
  }
}


