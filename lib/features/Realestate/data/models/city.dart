import '../../../../core/data_source/model.dart';
import 'names.dart';

class ListCityModel extends BaseModel {
  List<CityModel>? data;
  ListCityModel({this.data});
  factory ListCityModel.fromJson(Map<String, dynamic> json) => ListCityModel(
      data: List<CityModel>.from(
          json["payload"]!.map((x) => CityModel.fromJson(x))));
}

class CityModel extends BaseModel {
  String? id;
  NamesModel? names;

  CityModel({this.names, this.id});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        names:
            json['names'] != null ? NamesModel.fromJson(json['names']) : null,
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        'names': names?.toJson(),
        "id": id,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
