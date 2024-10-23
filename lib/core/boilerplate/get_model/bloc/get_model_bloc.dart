import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../results/result.dart';
import 'get_model_event.dart';
part 'get_model_state.dart';

typedef UseCaseCallBack = Future<Result> Function(); //dynamic data:params

  class GetModelBloc<Model> extends Bloc<GetModelEvent, GetModelState> {
  final UseCaseCallBack getData;
  GetModelBloc(this.getData) : super(GetModelInitial()) {
  on<GetModelEvent>((event, emit) async {
  if (event is BaseGetModelEvent) {
    emit(Loading());
    Result response;
    try {
      response = await getData(); // response = await GetExampleUseCase(ExampleRepository()).call(params: params);
      if (response.hasDataOnly) {
        emit(GetModelSuccessfully(model: response.data));
      } else if (response.hasErrorOnly) {
        emit(Error(message: response.error??''));
      } else {
        emit(Error(message: 'some thing went wrong'));
      }
    } catch (e) {
      emit(Error(message: 'some thing went wrong $e'));
     }
    }
   });
  }}