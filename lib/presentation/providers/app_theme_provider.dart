import 'package:disenos_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = StateNotifierProvider<AppThemeNotifier, AppTheme>((ref) {
  return AppThemeNotifier();
});

class AppThemeNotifier extends StateNotifier<AppTheme> {
  AppThemeNotifier(): super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode
    );
  }

  void toggleCustomTheme() {
    state = state.copyWith(
      isCustomTheme: !state.isCustomTheme
    );
  }
  
  
}