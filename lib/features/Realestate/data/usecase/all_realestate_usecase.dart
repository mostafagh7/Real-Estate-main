import 'package:real_estate/features/Realestate/data/models/realestate.dart';

import '../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repoistory/realestate_repo.dart';

class AllRealestateParams extends BaseParams {
  final GetListRequest? request;
  final String? offerType;
  final String? cityId;
  final String? subCategoryId;

  AllRealestateParams({
    required this.request, 
    this.offerType, 
    this.cityId, 
    this.subCategoryId
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (request != null) data.addAll(request!.toJson());
    data.putIfAbsent('OfferType', () => offerType);
    data.putIfAbsent('CityId', () => cityId);
    data.putIfAbsent('SubCategoryId', () => subCategoryId);

    return data;
  }
}

class AllRealestateUseCase
    extends UseCase<List<RealestateModel>, AllRealestateParams> {
  final RealestateRepository repository;

  AllRealestateUseCase(this.repository);

  @override
  Future<Result<List<RealestateModel>>> call(
      {required AllRealestateParams params}) {
    return repository.getAllRealestate(params: params);
  }
}
