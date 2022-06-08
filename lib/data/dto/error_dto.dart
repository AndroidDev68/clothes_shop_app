import 'package:flutter_application/domain/model/error_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable()
class ErrorDto extends ErrorModel {
  @override
  String message;

  @override
  String? statusCode;

  ErrorDto({required this.message, this.statusCode});

  factory ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDtoToJson(this);
}
