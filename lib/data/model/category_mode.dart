import 'package:get/get.dart';

class CategoryModel {
  final int id;
  final String title;
  late RxBool status;
  CategoryModel({required this.id, required this.title, required this.status});
}

final List<CategoryModel> listCategory = [
  CategoryModel(id: 1, title: "Pizza", status: false.obs),
  CategoryModel(id: 2, title: "Burger", status: false.obs),
  CategoryModel(id: 3, title: "Food", status: false.obs),
  CategoryModel(id: 4, title: "Drink", status: false.obs),
  CategoryModel(id: 5, title: "Coffee", status: false.obs),
];
