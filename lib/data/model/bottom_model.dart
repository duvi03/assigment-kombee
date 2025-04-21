import 'dart:convert';

class BottomModel {
  final List<RangeOfPattern> rangeOfPattern;
  final List<DesignOccasion> designOccasion;
  final String status;
  final String message;

  BottomModel({
    required this.rangeOfPattern,
    required this.designOccasion,
    required this.status,
    required this.message,
  });

  BottomModel copyWith({
    List<RangeOfPattern>? rangeOfPattern,
    List<DesignOccasion>? designOccasion,
    String? status,
    String? message,
  }) => BottomModel(
    rangeOfPattern: rangeOfPattern ?? this.rangeOfPattern,
    designOccasion: designOccasion ?? this.designOccasion,
    status: status ?? this.status,
    message: message ?? this.message,
  );

  factory BottomModel.fromRawJson(String str) =>
      BottomModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BottomModel.fromJson(Map<String, dynamic> json) => BottomModel(
    rangeOfPattern: List<RangeOfPattern>.from(
      json["range_of_pattern"].map((x) => RangeOfPattern.fromJson(x)),
    ),
    designOccasion: List<DesignOccasion>.from(
      json["design_occasion"].map((x) => DesignOccasion.fromJson(x)),
    ),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "range_of_pattern": List<dynamic>.from(
      rangeOfPattern.map((x) => x.toJson()),
    ),
    "design_occasion": List<dynamic>.from(
      designOccasion.map((x) => x.toJson()),
    ),
    "status": status,
    "message": message,
  };
}

class DesignOccasion {
  final String productId;
  final String name;
  final String image;
  final String subName;
  final String cta;

  DesignOccasion({
    required this.productId,
    required this.name,
    required this.image,
    required this.subName,
    required this.cta,
  });

  DesignOccasion copyWith({
    String? productId,
    String? name,
    String? image,
    String? subName,
    String? cta,
  }) => DesignOccasion(
    productId: productId ?? this.productId,
    name: name ?? this.name,
    image: image ?? this.image,
    subName: subName ?? this.subName,
    cta: cta ?? this.cta,
  );

  factory DesignOccasion.fromRawJson(String str) =>
      DesignOccasion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DesignOccasion.fromJson(Map<String, dynamic> json) => DesignOccasion(
    productId: json["product_id"],
    name: json["name"],
    image: json["image"],
    subName: json["sub_name"],
    cta: json["cta"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "image": image,
    "sub_name": subName,
    "cta": cta,
  };
}

class RangeOfPattern {
  final String productId;
  final String image;
  final String name;

  RangeOfPattern({
    required this.productId,
    required this.image,
    required this.name,
  });

  RangeOfPattern copyWith({String? productId, String? image, String? name}) =>
      RangeOfPattern(
        productId: productId ?? this.productId,
        image: image ?? this.image,
        name: name ?? this.name,
      );

  factory RangeOfPattern.fromRawJson(String str) =>
      RangeOfPattern.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RangeOfPattern.fromJson(Map<String, dynamic> json) => RangeOfPattern(
    productId: json["product_id"],
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "image": image,
    "name": name,
  };
}
