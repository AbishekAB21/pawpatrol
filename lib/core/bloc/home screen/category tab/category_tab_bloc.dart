import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_tab_event.dart';
import 'category_tab_state.dart';

/// Manages which category tab is currently selected on the home screen.
class CategoryTabBloc extends Bloc<CategoryTabEvent, CategoryTabState> {
  CategoryTabBloc() : super(const CategoryTabState()) {
    on<CategoryTabSelected>(_onCategoryTabSelected);
  }

  void _onCategoryTabSelected(
    CategoryTabSelected event,
    Emitter<CategoryTabState> emit,
  ) {
    if (event.index == state.selectedIndex) return;
    emit(state.copyWith(selectedIndex: event.index));
  }
}