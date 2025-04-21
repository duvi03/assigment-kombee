import 'dart:convert';

class MiddleModel {
  final List<ShopBy> shopByCategory;
  final List<ShopBy> shopByFabric;
  final List<Unstitched> unstitched;
  final List<BoutiqueCollection> boutiqueCollection;
  final String status;
  final String message;

  MiddleModel({
    required this.shopByCategory,
    required this.shopByFabric,
    required this.unstitched,
    required this.boutiqueCollection,
    required this.status,
    required this.message,
  });

  MiddleModel copyWith({
    List<ShopBy>? shopByCategory,
    List<ShopBy>? shopByFabric,
    List<Unstitched>? unstitched,
    List<BoutiqueCollection>? boutiqueCollection,
    String? status,
    String? message,
  }) => MiddleModel(
    shopByCategory: shopByCategory ?? this.shopByCategory,
    shopByFabric: shopByFabric ?? this.shopByFabric,
    unstitched: unstitched ?? this.unstitched,
    boutiqueCollection: boutiqueCollection ?? this.boutiqueCollection,
    status: status ?? this.status,
    message: message ?? this.message,
  );

  factory MiddleModel.fromRawJson(String str) =>
      MiddleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MiddleModel.fromJson(Map<String, dynamic> json) => MiddleModel(
    shopByCategory: List<ShopBy>.from(
      json["shop_by_category"].map((x) => ShopBy.fromJson(x)),
    ),
    shopByFabric: List<ShopBy>.from(
      json["shop_by_fabric"].map((x) => ShopBy.fromJson(x)),
    ),
    unstitched: List<Unstitched>.from(
      json["Unstitched"].map((x) => Unstitched.fromJson(x)),
    ),
    boutiqueCollection: List<BoutiqueCollection>.from(
      json["boutique_collection"].map((x) => BoutiqueCollection.fromJson(x)),
    ),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "shop_by_category": List<dynamic>.from(
      shopByCategory.map((x) => x.toJson()),
    ),
    "shop_by_fabric": List<dynamic>.from(shopByFabric.map((x) => x.toJson())),
    "Unstitched": List<dynamic>.from(unstitched.map((x) => x.toJson())),
    "boutique_collection": List<dynamic>.from(
      boutiqueCollection.map((x) => x.toJson()),
    ),
    "status": status,
    "message": message,
  };
}

class BoutiqueCollection {
  final String bannerImage;
  final String name;
  final String cta;
  final String bannerId;

  BoutiqueCollection({
    required this.bannerImage,
    required this.name,
    required this.cta,
    required this.bannerId,
  });

  BoutiqueCollection copyWith({
    String? bannerImage,
    String? name,
    String? cta,
    String? bannerId,
  }) => BoutiqueCollection(
    bannerImage: bannerImage ?? this.bannerImage,
    name: name ?? this.name,
    cta: cta ?? this.cta,
    bannerId: bannerId ?? this.bannerId,
  );

  factory BoutiqueCollection.fromRawJson(String str) =>
      BoutiqueCollection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BoutiqueCollection.fromJson(Map<String, dynamic> json) =>
      BoutiqueCollection(
        bannerImage: json["banner_image"],
        name: json["name"],
        cta: json["cta"],
        bannerId: json["banner_id"],
      );

  Map<String, dynamic> toJson() => {
    "banner_image": bannerImage,
    "name": name,
    "cta": cta,
    "banner_id": bannerId,
  };
}

class ShopBy {
  final String? categoryId;
  final String name;
  final String tintColor;
  final String image;
  final String sortOrder;
  final String? fabricId;

  ShopBy({
    this.categoryId,
    required this.name,
    required this.tintColor,
    required this.image,
    required this.sortOrder,
    this.fabricId,
  });

  ShopBy copyWith({
    String? categoryId,
    String? name,
    String? tintColor,
    String? image,
    String? sortOrder,
    String? fabricId,
  }) => ShopBy(
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    tintColor: tintColor ?? this.tintColor,
    image: image ?? this.image,
    sortOrder: sortOrder ?? this.sortOrder,
    fabricId: fabricId ?? this.fabricId,
  );

  factory ShopBy.fromRawJson(String str) => ShopBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShopBy.fromJson(Map<String, dynamic> json) => ShopBy(
    categoryId: json["category_id"],
    name: json["name"],
    tintColor: json["tint_color"],
    image: json["image"],
    sortOrder: json["sort_order"],
    fabricId: json["fabric_id"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "name": name,
    "tint_color": tintColor,
    "image": image,
    "sort_order": sortOrder,
    "fabric_id": fabricId,
  };
}

class Unstitched {
  final String rangeId;
  final String name;
  final String description;
  final String image;

  Unstitched({
    required this.rangeId,
    required this.name,
    required this.description,
    required this.image,
  });

  Unstitched copyWith({
    String? rangeId,
    String? name,
    String? description,
    String? image,
  }) => Unstitched(
    rangeId: rangeId ?? this.rangeId,
    name: name ?? this.name,
    description: description ?? this.description,
    image: image ?? this.image,
  );

  factory Unstitched.fromRawJson(String str) =>
      Unstitched.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Unstitched.fromJson(Map<String, dynamic> json) => Unstitched(
    rangeId: json["range_id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "range_id": rangeId,
    "name": name,
    "description": description,
    "image": image,
  };
}
