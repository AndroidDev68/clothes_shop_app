import 'package:flutter_application/data/dto/product_dto.dart';

abstract class FavoriteRepository{
  Future<List<ProductDto>> getListFavorite(int pageSize, int page);
}