class BottomNavState {
  final int selectedIndex;
  const BottomNavState({this.selectedIndex = 0});

  BottomNavState copyWith({int? selectedIndex}) =>
      BottomNavState(selectedIndex: selectedIndex ?? this.selectedIndex);
}