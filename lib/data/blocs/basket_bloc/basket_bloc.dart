import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/data/blocs/home/home_state.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/data/repositories/basket_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:get_it/get_it.dart';

class BasketBloc extends Cubit<Map<String, ProductDto>>{
  BasketBloc() : super({});

  void add(ProductDto productDto){
    if(state.containsKey(productDto.id.toString())){
      emit({
        ...state
      }..update(productDto.id.toString(), (value) => productDto));
    }else{
      emit({
        ...state,
        productDto.id.toString(): productDto
      });
    }
  }

  void addAll(List<ProductDto> listProductDto){
    var newState = {...state};
    listProductDto.forEach((element) {
      if(newState.containsKey(element.id.toString())){
        if(newState[element.id.toString()] != element){
          newState.update(element.id.toString(), (value) => element);
        }
      }else{
        newState.putIfAbsent(element.id.toString(), () => element);
      }
    });
    developer.log("value: new state: ${newState.length}", name:'tz');
    emit(newState);
  }

  void removeProduct(int productID){
    developer.log("value: click remove", name:'tz');
    state.remove(productID.toString());
    var newState = {...state};
    emit(newState);
    GetIt.instance.get<HomeBloc>().state.maybeWhen((notificationCount, basketCount, viewMode, productData){
      if(BasketRepositoryImpl.countItemInBasket  > 0){
        BasketRepositoryImpl.countItemInBasket -=1;
      }
      GetIt.instance.get<HomeBloc>().emit(HomeState(notificationCount, basketCount-1, viewMode, productData));
    }, orElse: (){});
  }
}