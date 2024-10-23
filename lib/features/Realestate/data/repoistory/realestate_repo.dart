import 'package:real_estate/features/Realestate/data/models/category.dart';
import 'package:real_estate/features/Realestate/data/usecase/all_category_usecase.dart';
import 'package:real_estate/features/Realestate/data/usecase/all_city_usecase.dart';

import '../../../../core/constant/end_points/api_url.dart';
import '../../../../core/data_source/remote_data_source.dart';
import '../../../../core/dio/http_method.dart';
import '../../../../core/repository/core_repository.dart';
import '../../../../core/results/result.dart';
import '../models/city.dart';
import '../models/details.dart';
import '../models/realestate.dart';
import '../usecase/all_realestate_usecase.dart';
import '../usecase/get_one_realestate_usecase.dart';

class RealestateRepository extends CoreRepository {
  Future<Result<RealestateDetailsModel>> getOneRealestate(
      {required GetOneRealestateParams params}) async {
    final result = await RemoteDataSource.request<RealestateDetailsModel>(
        withAuthentication: false,
        url: '$realestateURI/${params.realestateId}',
        method: HttpMethod.GET,
        responseStr: 'GetOneRealestateResponse',
        converter: (json) => RealestateDetailsModel.fromJson(json["payload"]));
    return call(result: result);
  }

  Future<Result<List<RealestateModel>>> getAllRealestate(
      {required AllRealestateParams params}) async {
    final result = await RemoteDataSource.request<ListRealestateModel>(
        withAuthentication: false,
        url: realestateURI,
        queryParameters: params.toJson(),
        method: HttpMethod.GET,
        responseStr: 'AllRealestateResponse',
        converter: (json) {
          return ListRealestateModel.fromJson(json);
        });

    return paginatedCall(result: result);
  }

  Future<Result<List<CityModel>>> getAllCity(
      {required AllCityParams params}) async {
    final result = await RemoteDataSource.request<ListCityModel>(
        withAuthentication: false,
        url: cityURI,
        queryParameters: params.toJson(),
        method: HttpMethod.GET,
        responseStr: 'AllCityResponse',
        converter: (json) {
          return ListCityModel.fromJson(json);
        });

    return paginatedCall(result: result);
  }

  Future<Result<List<CategoryModel>>> getAllCategory(
      {required AllCategoryParams params}) async {
    final result = await RemoteDataSource.request<ListCategoryModel>(
        withAuthentication: false,
        url: categoryURI,
        queryParameters: params.toJson(),
        method: HttpMethod.GET,
        responseStr: 'AllCategoryResponse',
        converter: (json) {
          return ListCategoryModel.fromJson(json);
        });

    return paginatedCall(result: result);
  }
}
