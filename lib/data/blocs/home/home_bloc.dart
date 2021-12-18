import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<Map<String, ProductDto>>{
  HomeBloc(Map<String, ProductDto> data) : super(data);

  void add(ProductDto productDto){
    if(state.containsKey(productDto.idModel.toString())){
      emit({
        ...state
      }..update(productDto.idModel.toString(), (value) => productDto));
    }else{
      emit({
        ...state,
        productDto.idModel.toString(): productDto
      });
    }
  }

  void addAll(List<ProductDto> productDtoList){
    final newState = {...state};
    productDtoList.forEach((element) {
      if(newState.containsKey(element.idModel.toString())) {
        if(newState[element.idModel.toString()] != element){
          newState.update(element.idModel.toString(), (value) => element);
        }
      }else{
        newState.putIfAbsent(element.idModel.toString(), () => element);
      }
    });
    emit(newState);
  }
}