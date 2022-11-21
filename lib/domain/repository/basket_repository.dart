import 'package:flutter_application/data/dto/product_dto.dart';

abstract class BasketRepository{
  Future<List<ProductDto>> getBasketProduct(int pageSize, int page);
  Future<int> getCountItemInBasket();
}