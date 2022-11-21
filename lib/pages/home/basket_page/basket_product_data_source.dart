import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter_application/data/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/data/repositories/basket_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';
import 'dart:developer' as developer;

class BasketProductDataSource extends paging.PageKeyedDataSource<int, ProductDto>{
  var basketRepository = GetIt.instance.get<BasketRepositoryImpl>();

  BasketProductDataSource() : super(pageSize: 10);

  @override
  Future<Tuple2<List<ProductDto>, int>> loadInitial(int pageSize) async {
    List<ProductDto> productModels = await basketRepository.getBasketProduct(10, 1);
    developer.log("value: productModels: ${productModels.length}", name:'tz');
    GetIt.instance.get<BasketBloc>().addAll(productModels);
    return Tuple2(productModels, 2);
  }

  @override
  Future<Tuple2<List<ProductDto>, int>> loadPageAfter(int params, int pageSize) async {
    List<ProductDto> productModels = await basketRepository.getBasketProduct(10, params);
    GetIt.instance.get<BasketBloc>().addAll(productModels);
    return Tuple2(productModels, params + 1);
  }
}