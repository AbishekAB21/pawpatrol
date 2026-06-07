import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<AppThemeMode> {
  ThemeCubit() : super(AppThemeMode.dark);

  void toggleTheme() {
    if (state == AppThemeMode.dark) {
      emit(AppThemeMode.light);
    } else {
      emit(AppThemeMode.dark);
    }
  }
}