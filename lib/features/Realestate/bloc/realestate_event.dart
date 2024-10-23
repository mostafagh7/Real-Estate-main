
import 'package:equatable/equatable.dart';

import '../data/models/category.dart';
import '../data/models/city.dart';

abstract class RealestateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetInitialCityEvent extends RealestateEvent {
  final List<CityModel> cities;

  SetInitialCityEvent(this.cities);

  @override
  List<Object> get props => [cities];
}

class GetStoredCityEvent extends RealestateEvent {}

class ChangeFilterCityTypeEvent extends RealestateEvent {
  final String newCityId;

  ChangeFilterCityTypeEvent(this.newCityId);

  @override
  List<Object> get props => [newCityId];
}

class ChangeSelectedCityEvent extends RealestateEvent {
  final CityModel city;

  ChangeSelectedCityEvent(this.city);

  @override
  List<Object> get props => [city];
}

class SetInitialCategoryEvent extends RealestateEvent {
  final List<CategoryModel> categories;

  SetInitialCategoryEvent(this.categories);

  @override
  List<Object> get props => [categories];
}

class GetStoredCategoryEvent extends RealestateEvent {}

class ChangeFilterCategoryTypeEvent extends RealestateEvent {
  final String newCategoryId;

  ChangeFilterCategoryTypeEvent(this.newCategoryId);

  @override
  List<Object> get props => [newCategoryId];
}

class ChangeSelectedCategoryEvent extends RealestateEvent {
  final CategoryModel category;

  ChangeSelectedCategoryEvent(this.category);

  @override
  List<Object> get props => [category];
}

class ChangeFilterOfferTypeEvent extends RealestateEvent {
  final String newOfferType;

  ChangeFilterOfferTypeEvent(this.newOfferType);

  @override
  List<Object> get props => [newOfferType];
}



class FetchRealestateDetailsEvent extends RealestateEvent {
  final String realestateId;

  FetchRealestateDetailsEvent(this.realestateId);
}
