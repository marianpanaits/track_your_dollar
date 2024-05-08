import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesState {}

class CreateCategoryLoadingState extends CategoriesState {}

class CreateCategorySuccessState extends CategoriesState {}

class CreateCategoryFailedState extends CategoriesState {
  final String? message;

  const CreateCategoryFailedState(this.message);
}
