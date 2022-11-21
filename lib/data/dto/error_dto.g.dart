// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) => ErrorDto(
      message: json['message'] as String,
      statusCode: json['statusCode'] as String?,
    );

Map<String, dynamic> _$ErrorDtoToJson(ErrorDto instance) => <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
