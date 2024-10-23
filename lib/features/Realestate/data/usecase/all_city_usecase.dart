import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../models/city.dart';
import '../repoistory/realestate_repo.dart';

class AllCityParams extends BaseParams {
  AllCityParams();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class AllCityUseCase extends UseCase<List<CityModel>, AllCityParams> {
  final RealestateRepository repository;

  AllCityUseCase(this.repository);

  @override
  Future<Result<List<CityModel>>> call({required AllCityParams params}) {
    return repository.getAllCity(params: params);
  }
}
