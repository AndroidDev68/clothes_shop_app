import 'dart:math';

import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/domain/repository/home_repository.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';

class HomeRepositoryImpl extends HomeRepository{
  final suPaBaseClient = GetIt.instance.get<SupabaseClient>();
  @override
  Future<List<ProductDto>> getProduct(String? type, String? suggestName,int pageSize,int page) async {
    final response = await suPaBaseClient.from('product').select('*').execute();
    
    await Future.delayed(const Duration(seconds: 1));
    List<ProductDto> productModels = [];
    List<String> images = [
      Assets.images.jacket3.path,
      Assets.images.jacket12.path,
      Assets.images.jacket13.path,
      Assets.images.jacket14.path,
      Assets.images.jacket16.path,
      Assets.images.jacket33.path,
    ];

    if(type != null){
      if(page < 10){
        for(int i = 0; i < pageSize; i++){
          productModels.add(ProductDto(
              id: page*10+i,
              favorite: (page*10+i)/4 == 0 ? true: false,
              image: images[Random().nextInt(6)],
              name: lorem(paragraphs: 1, words: 2),
              price: "\$" + (Random().nextInt(100) + Random().nextDouble()).toStringAsFixed(2),
              sizes: ["S","M","L", "XL", "XXL"],
              stars: Random().nextInt(4) + Random().nextDouble(),
              descriptions: lorem(paragraphs: 3, words: 200),
              productCategory: "Geeta $type " + lorem(paragraphs: 1, words: 1),
              countOnBasket: 0,
              favorites: false
          ),
          );
        }
      }
    }else if(suggestName != null){
      if(page < 10){
        for(int i = 0; i < pageSize; i++){
          productModels.add(ProductDto(
              id: page*10+i,
              favorite: (page*10+i)/4 == 0 ? true: false,
              image: images[Random().nextInt(6)],
              name: suggestName + lorem(paragraphs: 1, words: 2),
              price: "\$" + (Random().nextInt(100) + Random().nextDouble()).toStringAsFixed(2),
              sizes: ["S","M","L", "XL", "XXL"],
              stars: Random().nextInt(4) + Random().nextDouble(),
              descriptions: lorem(paragraphs: 3, words: 200),
              productCategory: "Geeta $type " + lorem(paragraphs: 1, words: 1),
              countOnBasket: 0,
              favorites: false
          ),
          );
        }
      }
    }

    return productModels;
  }
}