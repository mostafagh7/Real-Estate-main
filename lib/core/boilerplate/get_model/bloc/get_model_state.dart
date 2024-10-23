part of 'get_model_bloc.dart';

abstract class GetModelState {}

class GetModelInitial extends GetModelState {}

class Loading extends GetModelState {}

class GetModelSuccessfully extends GetModelState {
  final dynamic model;

  GetModelSuccessfully({this.model});
}

class Error extends GetModelState {
  final String message;
  Error({required this.message});
}
