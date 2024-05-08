import 'package:dartz/dartz.dart';
import 'package:track_your_dollar/core/error/failure.dart';
import 'package:track_your_dollar/core/mixin/repository_mixin.dart';
import 'package:track_your_dollar/features/categories/data/datasource/categories_datasource.dart';
import 'package:track_your_dollar/features/categories/data/model/category_model.dart';
import 'package:track_your_dollar/features/categories/domain/repository/categories_repository.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/category_params.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final RepositoryMixin repositoryMixin;
  final CategoriesDatasource categoriesDatasource;

  CategoriesRepositoryImpl(
      {required this.repositoryMixin, required this.categoriesDatasource});

  @override
  Future<Either<Failure, CategoryModel>> createCategory(
      CategoryParams params) async {
    return repositoryMixin
        .call(() async => categoriesDatasource.createCategory(params));
  }
}
