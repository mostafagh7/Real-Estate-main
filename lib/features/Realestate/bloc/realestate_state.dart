import 'package:equatable/equatable.dart';
import '../../../core/results/result.dart';
import '../data/models/city.dart';
import '../data/models/category.dart';

abstract class RealestateState extends Equatable {
  @override
  List<Object> get props => [];
}

class RealestateInitial extends RealestateState {}

class CityListLoaded extends RealestateState {
  final List<CityModel> cityList;

  CityListLoaded(this.cityList);

  @override
  List<Object> get props => [cityList];
}

class CategoryListLoaded extends RealestateState {
  final List<CategoryModel> categoryList;

  CategoryListLoaded(this.categoryList);

  @override
  List<Object> get props => [categoryList];
}

class RealestateError extends RealestateState {
  final String message;

  RealestateError(this.message);

  @override
  List<Object> get props => [message];
}

class FilterChangeSelectedCityState extends RealestateState {}
class FilterChangeSelectedCategoryState extends RealestateState {}
class FilterChangeCityState extends RealestateState {}
class FilterChangeCategoryState extends RealestateState {}
class SetInitialCityState extends RealestateState {}
class SetInitialCategoryState extends RealestateState {}
class ChangeFilterOfferTypeState extends RealestateState {}
class CitiesFetchedSuccessfully extends RealestateState {
  final Result<dynamic> cities;

  CitiesFetchedSuccessfully(this.cities);

  
}
