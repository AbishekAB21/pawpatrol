import 'package:equatable/equatable.dart';

/// Base class for all events handled by [CategoryTabBloc].
abstract class CategoryTabEvent extends Equatable {
  const CategoryTabEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when the user taps a category tab.
class CategoryTabSelected extends CategoryTabEvent {
  final int index;

  const CategoryTabSelected(this.index);

  @override
  List<Object?> get props => [index];
}