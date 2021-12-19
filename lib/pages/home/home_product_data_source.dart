import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/data/repositories/home_repository_impl.dart';
import 'package:flutter_application/domain/repository/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';
class HomeProductDataSource extends paging.PageKeyedDataSource<int, ProductDto>{
  
  HomeRepository homeRepository = GetIt.instance.get<HomeRepositoryImpl>();
  final String? type;
  final String? suggestName;

  HomeProductDataSource({this.type, this.suggestName}) :super(pageSize: 10);

  @override
  Future<Tuple2<List<ProductDto>, int>> loadInitial(int pageSize) async {
    List<ProductDto> productDto = await homeRepository.getProduct(type, suggestName, 10, 1);
    GetIt.instance.get<HomeBloc>().addAll(productDto);
    return Tuple2(productDto, 2);
  }

  @override
  Future<Tuple2<List<ProductDto>, int>> loadPageAfter(int params, int pageSize) async {
    List<ProductDto> productDto = await homeRepository.getProduct(type, suggestName, 10, params);
    GetIt.instance.get<HomeBloc>().addAll(productDto);
    return Tuple2(productDto, params + 1);
  }
}