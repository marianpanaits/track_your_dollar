import 'package:dartz/dartz.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/categories/data/model/category_model.dart';
import 'package:track_your_dollar/features/categories/domain/repository/categories_repository.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/category_params.dart';

class CreateCategoryUseCase {
  final CategoriesRepository _repository;

  CreateCategoryUseCase(this._repository);

  Future<Either<Failure, CategoryModel>> call(CategoryParams params) async {
    return await _repository.createCategory(params);
  }
}
