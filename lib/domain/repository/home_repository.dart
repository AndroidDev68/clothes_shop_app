import 'package:flutter_application/data/dto/product_dto.dart';

abstract class HomeRepository{
  Future<List<ProductDto>> getProduct(String? type,String? suggestName, int pageSize, int page);
}