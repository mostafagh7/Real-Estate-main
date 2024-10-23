import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../results/result.dart';
import '../models/get_list_request.dart';
import 'pagination_event.dart';
part 'pagination_state.dart';

typedef RepositoryCallBack = Future<Result>? Function(dynamic data);

  class PaginationBloc<ListModel> extends Bloc<PaginationEvent, PaginationState> {
  final RepositoryCallBack getData;
  List<ListModel> list = [];
  Map<String, dynamic> params = {};
  int results = 10;
  int page = 1;

  PaginationBloc(this.getData) : super(PaginationInitial()) {
    on<PaginationEvent>((event, emit) async {
    if (event is BasePaginationEvent) {
    if (!event.loadMore) {
      page = 1;
      emit(Loading());
    } else {
      page++;
    }

    var requestData = GetListRequest(
      results: results,
      page: page,
    );
    var response = await getData(requestData);

    if (response == null) {
      emit(PaginationInitial());
    } else {
      if (response.hasDataOnly) {
        if (event.loadMore) {
          list.addAll(response.data);
        } else {
          if (kDebugMode) {
            print(response.data);
          }
          list = response.data;
        }

        emit(GetListSuccessfully(
            list: list.toSet().toList(),
            noMoreData: (response.data.toSet().toList() as List<ListModel>).isEmpty && event.loadMore));
      } else if (response.hasErrorOnly) {
        if (response.error != null) {
          emit(Error(response.error??''));
        }
        emit(Error('Some Thing went wrong'));
      } else {
        emit(PaginationInitial());
      }
    }
  }});}
}