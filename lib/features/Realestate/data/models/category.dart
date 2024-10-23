import '../../../../core/data_source/model.dart';
import 'names.dart';

class ListCategoryModel extends BaseModel {
  List<CategoryModel>? data;

  ListCategoryModel({this.data});

  factory ListCategoryModel.fromJson(Map<String, dynamic> json) =>
      ListCategoryModel(
          data: List<CategoryModel>.from(
              json["payload"]!.map((x) => CategoryModel.fromJson(x))));
}

class CategoryModel extends BaseModel {
  String? id;
  NamesModel? names;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    this.id,
    this.names,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        names:
            json['names'] != null ? NamesModel.fromJson(json['names']) : null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'names': names?.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
