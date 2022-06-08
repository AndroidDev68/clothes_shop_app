import 'package:dio/dio.dart';
import 'package:supabase/supabase.dart';

import '../constants.dart';
import '../data/dto/error_dto.dart';
import '../domain/model/error_model.dart';
import 'dart:developer' as developer;

mixin HandleError{
  ErrorModel getError(dynamic dataError) {
    if (dataError is DioError) {
      return ErrorDto(
          message: dataError.message,
          statusCode: dataError.response?.statusCode.toString() ?? "-1");
    }
    else if(dataError is GotrueError){
      return ErrorDto(message: dataError.message, statusCode: dataError.statusCode);
    }
    else {
      if (dataError is Error) {
        developer.log("message ${(dataError.stackTrace)}",
            name: "BaseApiService");
      }
      return ErrorDto(message: errorHandleMessage, statusCode: "-1");
    }
  }
}