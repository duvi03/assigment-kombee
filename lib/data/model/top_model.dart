import 'dart:convert';

class TopModel {
  final List<MainStickyMenu> mainStickyMenu;
  final String status;
  final String message;

  TopModel({
    required this.mainStickyMenu,
    required this.status,
    required this.message,
  });

  TopModel copyWith({
    List<MainStickyMenu>? mainStickyMenu,
    String? status,
    String? message,
  }) => TopModel(
    mainStickyMenu: mainStickyMenu ?? this.mainStickyMenu,
    status: status ?? this.status,
    message: message ?? this.message,
  );

  factory TopModel.fromRawJson(String str) =>
      TopModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopModel.fromJson(Map<String, dynamic> json) => TopModel(
    mainStickyMenu: List<MainStickyMenu>.from(
      json["main_sticky_menu"].map((x) => MainStickyMenu.fromJson(x)),
    ),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "main_sticky_menu": List<dynamic>.from(
      mainStickyMenu.map((x) => x.toJson()),
    ),
    "status": status,
    "message": message,
  };
}

class MainStickyMenu {
  final String title;
  final String image;
  final String sortOrder;
  final List<MainStickyMenu>? sliderImages;
  final String? cta;

  MainStickyMenu({
    required this.title,
    required this.image,
    required this.sortOrder,
    this.sliderImages,
    this.cta,
  });

  MainStickyMenu copyWith({
    String? title,
    String? image,
    String? sortOrder,
    List<MainStickyMenu>? sliderImages,
    String? cta,
  }) => MainStickyMenu(
    title: title ?? this.title,
    image: image ?? this.image,
    sortOrder: sortOrder ?? this.sortOrder,
    sliderImages: sliderImages ?? this.sliderImages,
    cta: cta ?? this.cta,
  );

  factory MainStickyMenu.fromRawJson(String str) =>
      MainStickyMenu.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainStickyMenu.fromJson(Map<String, dynamic> json) => MainStickyMenu(
    title: json["title"],
    image: json["image"],
    sortOrder: json["sort_order"],
    sliderImages:
        json["slider_images"] == null
            ? []
            : List<MainStickyMenu>.from(
              json["slider_images"]!.map((x) => MainStickyMenu.fromJson(x)),
            ),
    cta: json["cta"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "sort_order": sortOrder,
    "slider_images":
        sliderImages == null
            ? []
            : List<dynamic>.from(sliderImages!.map((x) => x.toJson())),
    "cta": cta,
  };
}
