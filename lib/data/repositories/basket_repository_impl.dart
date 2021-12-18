import 'dart:math';

import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/domain/repository/basket_repository.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class BasketRepositoryImpl extends BasketRepository{
  final int countItemInBasket = Random().nextInt(20);
  int countItemHasResponse = 0;
  @override
  Future<List<ProductDto>> getBasketProduct(int pageSize, int page) async {
    List<ProductDto> productModels = [];

    List<String> images = [
      Assets.images.jacket3.path,
      Assets.images.jacket12.path,
      Assets.images.jacket13.path,
      Assets.images.jacket14.path,
      Assets.images.jacket16.path,
      Assets.images.jacket33.path,
    ];

    if(countItemHasResponse < countItemInBasket ){
      int count = 10;
      if(countItemInBasket - countItemHasResponse < 10){
        count = countItemInBasket - countItemHasResponse;
      }
      for(int i = 0; i<count; i++){
        productModels.add(ProductDto(
            id: page*10+i,
            favorite: (page*10+i)/4 == 0 ? true: false,
            image: images[Random().nextInt(6)],
            name: lorem(paragraphs: 1, words: 2),
            price: "\$" + (Random().nextInt(100) + Random().nextDouble()).toStringAsPrecision(4),
            sizes: ["S","M","L", "XL", "XXL"],
            stars: Random().nextInt(4) + Random().nextDouble(),
            descriptions: lorem(paragraphs: 3, words: 200),
            productCategory: "Geeta basket " + lorem(paragraphs: 1, words: 1)
          ),
        );
        countItemHasResponse++;
      }
    }

    return productModels;
  }

  @override
  Future<int> getCountItemInBasket() async{
    return countItemInBasket;
  }
}