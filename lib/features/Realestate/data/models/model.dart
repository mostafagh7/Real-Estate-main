
import '../../../../core/data_source/model.dart';

class DefaultModel extends BaseModel{
  String? id;
  String? name;
  

  DefaultModel({
    this.id,
    this.name,
  });


  factory DefaultModel.fromJson(Map<String, dynamic> json) => DefaultModel(
    id: json["id"],
    name: json["name"],
    );
}