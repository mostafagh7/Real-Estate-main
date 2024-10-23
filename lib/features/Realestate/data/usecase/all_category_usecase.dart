import 'package:real_estate/features/Realestate/data/models/category.dart';
import '../../../../core/params/base_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repoistory/realestate_repo.dart';

class AllCategoryParams extends BaseParams {
  AllCategoryParams();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class AllCategoryUseCase extends UseCase<List<CategoryModel>, AllCategoryParams> {
  final RealestateRepository repository;

  AllCategoryUseCase(this.repository);

  @override
  Future<Result<List<CategoryModel>>> call({required AllCategoryParams params}) {
    return repository.getAllCategory(params: params);
  }
}
