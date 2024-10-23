import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../dio/api_provider.dart';
import '../dio/http_method.dart';
import 'model.dart';

abstract class RemoteDataSource {
  static Future<Either<String, Data>> request<Data extends BaseModel>({
    required String responseStr,
    required Function(Map<String, dynamic>) converter,
    required HttpMethod method,
    required String url,
    File? file,
    File? secondFile,
    String? fileKey,
    String? secondFileKey,
    List<File>? files,
    List<File>? videoFiles,
    String? fileVideoKey,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? payload,
    bool withAuthentication = false,
  }) async {
    final Map<String, String> headers = {};
    String? leftResponse;
    dynamic rightResponse;


    headers.putIfAbsent("Content-Type", () => 'application/json');
    // if (withAuthentication) {
    //   // await checkTokenValidation();
    //   final String token = CacheHelper.token!;
    //   debugPrint(token);
    //   headers.putIfAbsent(headerAuth, () => 'Bearer $token');
    // }
    // headers.putIfAbsent(LanguageKey, () => '${CashHelper.getData(key: LanguageValue)}');
    final response = await ApiProvider.sendObjectRequest(
        method: method,
        url: url,
        headers: headers,
        queryParameters: queryParameters,
        payload: payload,
        strString: responseStr,
        file: file,
        fileKey: fileKey,
        secondFileKey: secondFileKey,
        secondFile: secondFile,
        imageFiles: files,
        fileVideoKey: fileVideoKey,
        videoFiles: videoFiles,
        converter: converter
    );
    debugPrint(response.toString());

    if (kDebugMode) {
      print('is right : ${response.isRight()}');
    }
    response.fold((l) => leftResponse = l, (r) => Right(rightResponse = r));
    if (response.isLeft()) {
      return Left(leftResponse ?? '');
    } else {
      return Right(rightResponse);
    }
  }

  static Future<Either<String, String>> noModelRequest({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    // required bool withAuthentication,
  }) async {
    String? leftResponse;
    dynamic rightResponse;
    final Map<String, String> headers = {};

    // if (withAuthentication) {
    //   // await checkTokenValidation();
    //   String token = CacheHelper.token!;
    //   headers.putIfAbsent(headerAuth, () => 'Bearer $token');
    // }
    // headers.putIfAbsent(LanguageKey, () => '${CashHelper.getData(key: LanguageValue)}');

    final response = await ApiProvider.sendObjectWithOutResponseRequest(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      data: data,
    );

    if (kDebugMode) {
      print('is right : ${response.isRight()}');
    }
    response.fold((l) => leftResponse = l, (r) => Right(rightResponse = r));
    if (response.isLeft()) {
      return Left(leftResponse ?? '');
    } else {
      return Right(rightResponse);
    }
  }
}