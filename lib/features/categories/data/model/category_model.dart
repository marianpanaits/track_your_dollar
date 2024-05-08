import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final int? amount;
  final String? type;

  CategoryModel({required this.id, required this.name, this.amount, this.type});

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
        id: doc.id,
        name: data['name'],
        amount: data['amount'],
        type: data['type']);
  }

  // Serialize to Firestore
  Map<String, dynamic> toFirestore() {
    return {'name': name, 'amount': amount, 'type': type};
  }
}
