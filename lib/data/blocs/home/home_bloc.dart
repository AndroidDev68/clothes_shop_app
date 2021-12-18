import 'package:flutter_application/data/blocs/home/home_state.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/data/repositories/basket_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'view_mode.dart';

class HomeBloc extends Cubit<HomeState>{
  HomeBloc() : super(const HomeState.loading());
  var basketRepository = GetIt.instance.get<BasketRepositoryImpl>();

  Future<void> init() async {
    int countItemOnBasket = await basketRepository.getCountItemInBasket();
    emit(HomeStateData(1, countItemOnBasket, ViewMode.gridview, {}));
  }

  void changeViewMode(ViewMode viewModeChange){
    state.maybeWhen((notificationCount, basketCount, viewMode, productData) {
      if(viewModeChange != viewMode){
        emit(HomeStateData(notificationCount, basketCount, viewModeChange, productData));
      }
    }, orElse: (){

    });
  }

  void add(ProductDto productDto){
    state.maybeWhen((notificationCount, basketCount, viewMode, productData) {
      var newProductData;
      if(productData.containsKey(productDto.idModel.toString())){
         newProductData = {
          ...productData
        }..update(productDto.idModel.toString(), (value) => productDto);
      }else{
        newProductData = {
          ...productData,
          productDto.idModel.toString(): productDto
        };
      }
      emit(HomeState(notificationCount, basketCount, viewMode, newProductData) );
    }, orElse: (){

    });

  }

  void addAll(List<ProductDto> productDtoList){

    state.maybeWhen((notificationCount, basketCount, viewMode, productData) {
      final newProductState = {...productData};
      productDtoList.forEach((element) {
        if(newProductState.containsKey(element.idModel.toString())) {
          if(newProductState[element.idModel.toString()] != element){
            newProductState.update(element.idModel.toString(), (value) => element);
          }
        }else{
          newProductState.putIfAbsent(element.idModel.toString(), () => element);
        }
      });
      emit(HomeState(notificationCount, basketCount, viewMode, newProductState));
    }, orElse: (){

    });


  }


}