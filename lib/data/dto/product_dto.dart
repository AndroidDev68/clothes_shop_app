import 'package:flutter_application/domain/model/product_model.dart';

class ProductDto extends ProductModel {
  @override
  int get idModel => id;

  @override
  bool get favoriteModel => favorite;

  @override
  String get imageModel => image;

  @override
  String get nameModel => name;

  @override
  String get priceMode => price;

  @override
  String? demo;

  int id;
  bool favorite;
  String image;
  String name;
  String price;
  List<String> sizes;
  double stars;
  String descriptions;
  String productCategory;
  int countOnBasket;
  bool favorites;

//<editor-fold desc="Data Methods">

  ProductDto({
    required this.id,
    required this.favorite,
    required this.image,
    required this.name,
    required this.price,
    required this.sizes,
    required this.stars,
    required this.descriptions,
    required this.productCategory,
    required this.countOnBasket,
    required this.favorites,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          favorite == other.favorite &&
          image == other.image &&
          name == other.name &&
          price == other.price &&
          sizes == other.sizes &&
          stars == other.stars &&
          descriptions == other.descriptions &&
          productCategory == other.productCategory &&
          countOnBasket == other.countOnBasket &&
          favorites == other.favorites);

  @override
  int get hashCode =>
      id.hashCode ^
      favorite.hashCode ^
      image.hashCode ^
      name.hashCode ^
      price.hashCode ^
      sizes.hashCode ^
      stars.hashCode ^
      descriptions.hashCode ^
      productCategory.hashCode ^
      countOnBasket.hashCode ^
      favorites.hashCode;

  @override
  String toString() {
    return 'ProductDto{' +
        ' id: $id,' +
        ' favorite: $favorite,' +
        ' image: $image,' +
        ' name: $name,' +
        ' price: $price,' +
        ' sizes: $sizes,' +
        ' stars: $stars,' +
        ' descriptions: $descriptions,' +
        ' productCategory: $productCategory,' +
        ' countOnBasket: $countOnBasket,' +
        ' favorites: $favorites,' +
        '}';
  }

  ProductDto copyWith({
    int? id,
    bool? favorite,
    String? image,
    String? name,
    String? price,
    List<String>? sizes,
    double? stars,
    String? descriptions,
    String? productCategory,
    int? countOnBasket,
    bool? favorites,
  }) {
    return ProductDto(
      id: id ?? this.id,
      favorite: favorite ?? this.favorite,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      sizes: sizes ?? this.sizes,
      stars: stars ?? this.stars,
      descriptions: descriptions ?? this.descriptions,
      productCategory: productCategory ?? this.productCategory,
      countOnBasket: countOnBasket ?? this.countOnBasket,
      favorites: favorites ?? this.favorites,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'favorite': this.favorite,
      'image': this.image,
      'name': this.name,
      'price': this.price,
      'sizes': this.sizes,
      'stars': this.stars,
      'descriptions': this.descriptions,
      'productCategory': this.productCategory,
      'countOnBasket': this.countOnBasket,
      'favorites': this.favorites,
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] as int,
      favorite: map['favorite'] as bool,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      sizes: map['sizes'] as List<String>,
      stars: map['stars'] as double,
      descriptions: map['descriptions'] as String,
      productCategory: map['productCategory'] as String,
      countOnBasket: map['countOnBasket'] as int,
      favorites: map['favorites'] as bool,
    );
  }

//</editor-fold>
}
