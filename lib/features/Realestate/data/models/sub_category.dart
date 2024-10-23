import '../../../../core/data_source/model.dart';
import 'names.dart';

class ListSubCategoryModel extends BaseModel {
  List<SubCategoryModel>? data;

  ListSubCategoryModel({this.data});

  factory ListSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      ListSubCategoryModel(
          data: List<SubCategoryModel>.from(
              json["payload"]!.map((x) => SubCategoryModel.fromJson(x))));
}

class SubCategoryModel extends BaseModel {
  String? id;
  int? sortingIndex;
  bool? isActive;
  bool? isDeleted;
  String? image;
  NamesModel? names;
  // CategoryModel? category;
  List<String>? realestateFeatures;
  List<String>? features;

  SubCategoryModel({
    this.id,
    this.sortingIndex,
    this.isActive,
    this.isDeleted,
    this.image,
    this.names,
    // this.category,
    this.realestateFeatures,
    this.features,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["id"],
        sortingIndex: json["sorting_index"],
        isActive: json["is_active"],
        isDeleted: json["is_deleted"],
        image: json["image"],
        names: json["names"] != null ? NamesModel.fromJson(json["names"]) : null,
        realestateFeatures: json["realestate_features"]?.cast<String>(),
        features: json["features"]?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sorting_index': sortingIndex,
        'is_active': isActive,
        'is_deleted': isDeleted,
        'image': image,
        'names': names?.toJson(),
        'realestate_features': realestateFeatures,
        'features': features,
      };
}
