import 'package:equatable/equatable.dart';

/// State for [CategoryTabBloc] — tracks which category tab is selected.
class CategoryTabState extends Equatable {
  final int selectedIndex;

  const CategoryTabState({this.selectedIndex = 0});

  CategoryTabState copyWith({int? selectedIndex}) {
    return CategoryTabState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [selectedIndex];
}