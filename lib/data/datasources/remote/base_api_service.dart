import 'package:dio/dio.dart';
import 'package:flutter_application/data/dto/error_dto.dart';
import 'package:flutter_application/domain/model/error_model.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import 'dart:developer' as developer;

import '../../../constants.dart';

class BaseApiService {
  Dio dio = GetIt.instance.get();
  SupabaseClient suPaBaseClient = GetIt.instance.get();

  ErrorModel getError(dynamic dataError) {
    if (dataError is DioError) {
      return ErrorDto(
          message: dataError.message,
          statusCode: dataError.response?.statusCode.toString() ?? "-1");
    } else {
      if (dataError is Error) {
        developer.log("message ${(dataError.stackTrace)}",
            name: "BaseApiService");
      }
      return ErrorDto(message: errorHandleMessage, statusCode: "-1");
    }
  }
}
