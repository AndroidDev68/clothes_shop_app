import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'view_mode.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState(int notificationCount, int basketCount,
      ViewMode viewMode, Map<String, ProductDto> productData) = HomeStateData;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error(dynamic error) = HomeStateError;
}