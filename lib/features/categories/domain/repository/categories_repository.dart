import 'package:dartz/dartz.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/features/categories/data/model/category_model.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/category_params.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoryModel>> createCategory(CategoryParams params);
}
