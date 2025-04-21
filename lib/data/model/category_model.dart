import 'dart:convert';

class CategoryModel {
  final List<Category> categories;
  final String bannerImage;
  final String status;
  final String message;

  CategoryModel({
    required this.categories,
    required this.bannerImage,
    required this.status,
    required this.message,
  });

  CategoryModel copyWith({
    List<Category>? categories,
    String? bannerImage,
    String? status,
    String? message,
  }) => CategoryModel(
    categories: categories ?? this.categories,
    bannerImage: bannerImage ?? this.bannerImage,
    status: status ?? this.status,
    message: message ?? this.message,
  );

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categories: List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    ),
    bannerImage: json["banner_image"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "banner_image": bannerImage,
    "status": status,
    "message": message,
  };

  @override
  String toString() {
    return 'CategoryModel{categories: $categories, bannerImage: $bannerImage, status: $status, message: $message}';
  }
}

class Category {
  final String categoryId;
  final String categoryName;
  final String parentId;
  final List<Category>? child;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.parentId,
    this.child,
  });

  Category copyWith({
    String? categoryId,
    String? categoryName,
    String? parentId,
    List<Category>? child,
  }) => Category(
    categoryId: categoryId ?? this.categoryId,
    categoryName: categoryName ?? this.categoryName,
    parentId: parentId ?? this.parentId,
    child: child ?? this.child,
  );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    parentId: json["parent_id"],
    child:
        json["child"] == null
            ? []
            : List<Category>.from(
              json["child"]!.map((x) => Category.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "parent_id": parentId,
    "child":
        child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Category{categoryId: $categoryId, categoryName: $categoryName, parentId: $parentId, child: $child}';
  }
}
