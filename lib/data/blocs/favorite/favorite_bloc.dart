import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Cubit<Map<String, ProductDto>>{
  FavoriteBloc() : super({});

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
    emit(newState);
  }

}