import 'package:real_estate/features/Realestate/data/repoistory/realestate_repo.dart';

import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../models/details.dart';

class GetOneRealestateParams extends BaseParams {
  final String realestateId;
  GetOneRealestateParams({required this.realestateId});
}

class GetOneReatestateUseCase
    extends UseCase<RealestateDetailsModel, GetOneRealestateParams> {
  final RealestateRepository repository;

  GetOneReatestateUseCase(this.repository);

  @override
  Future<Result<RealestateDetailsModel>> call(
      {required GetOneRealestateParams params}) {
    return repository.getOneRealestate(params: params);
  }
}
