import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateCategoryEvent extends CategoriesEvent {
  final String name;
  final int amount;
  final String type;

  CreateCategoryEvent(
      {required this.name, this.amount = 1000, required this.type});
}
