import 'dart:convert';

class CategoryModel {
  List<Category>? categories;
  String? bannerImage;
  String? status;
  String? message;

  CategoryModel({this.categories, this.bannerImage, this.status, this.message});

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
    categories:
        json["categories"] == null
            ? []
            : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x)),
            ),
    bannerImage: json["banner_image"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "categories":
        categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "banner_image": bannerImage,
    "status": status,
    "message": message,
  };
}

class Category {
  String? categoryId;
  String? categoryName;
  String? parentId;
  List<Category>? child;

  Category({this.categoryId, this.categoryName, this.parentId, this.child});

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
}
