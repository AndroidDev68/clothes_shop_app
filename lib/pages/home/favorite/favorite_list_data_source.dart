import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter_application/data/blocs/favorite/favorite_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/data/repositories/favorite_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';

class FavoriteListDataSource extends paging.PageKeyedDataSource<int, ProductDto>{
  var favoriteRepository = GetIt.instance.get<FavoriteRepositoryImpl>();

  FavoriteListDataSource():super(pageSize: 10);

  @override
  Future<Tuple2<List<ProductDto>, int>> loadInitial(int pageSize) async {
    List<ProductDto> productList = await favoriteRepository.getListFavorite(10, 1);
    GetIt.instance.get<FavoriteBloc>().addAll(productList);
    return Tuple2(productList, 2);
  }

  @override
  Future<Tuple2<List<ProductDto>, int>> loadPageAfter(int params, int pageSize) async {
    List<ProductDto> productList = await favoriteRepository.getListFavorite(10, params);
    GetIt.instance.get<FavoriteBloc>().addAll(productList);
    return Tuple2(productList, params+1);
  }
}