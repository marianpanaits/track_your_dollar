import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:track_your_dollar/features/categories/data/model/category_model.dart';
import 'package:track_your_dollar/features/categories/domain/usecase/category_params.dart';

class CategoriesDatasource {
  final CollectionReference _categoriesCollection =
      FirebaseFirestore.instance.collection('categories');

  Future<CategoryModel> createCategory(CategoryParams params) async {
    return await _categoriesCollection.add({
      'name': params.name,
      'amount': params.amount,
      'type': params.categoryType,
    }).then((value) async {
      DocumentSnapshot doc = await value.get();
      return CategoryModel.fromFirestore(doc);
    });
  }
}
