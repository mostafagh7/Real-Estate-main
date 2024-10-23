import 'package:real_estate/features/Realestate/data/models/model.dart';

import '../../../../core/data_source/model.dart';

class ListRealestateModel extends BaseModel {
  List<RealestateModel>? data;
  ListRealestateModel({this.data});
  factory ListRealestateModel.fromJson(Map<String, dynamic> json) =>
      ListRealestateModel(
          data: List<RealestateModel>.from(
              json["payload"]!.map((x) => RealestateModel.fromJson(x))));
}

class RealestateModel extends BaseModel {
  String? id;
  String? createdAt;
  String? title;
  String? ownerType;
  String? ownerName;
  String? ownerImageUrl;
  String? offerType;
  double? lat;
  double? lng;
  double? price;
  int? area;
  int? views;
  int? imagesCount;
  bool? hasVideo;
  bool? isUrgent;
  int? age;
  int? noOfRooms;
  int? noOfBedRooms;
  int? noOfBathRooms;
  int? noOfLivingRooms;
  int? noOfFloors;
  int? parkingCapacity;
  String? image;
  DefaultModel? country;
  DefaultModel? city;
  DefaultModel? district;
  DefaultModel? subDistrict;
  DefaultModel? category;
  DefaultModel? subCategory;

  RealestateModel(
      {this.id,
      this.createdAt,
      this.title,
      this.ownerType,
      this.ownerName,
      this.ownerImageUrl,
      this.offerType,
      this.lat,
      this.lng,
      this.price,
      this.area,
      this.views,
      this.imagesCount,
      this.hasVideo,
      this.isUrgent,
      this.age,
      this.noOfRooms,
      this.noOfBedRooms,
      this.noOfBathRooms,
      this.noOfLivingRooms,
      this.noOfFloors,
      this.parkingCapacity,
      this.image,
      this.country,
      this.city,
      this.district,
      this.subDistrict,
      this.category,
      this.subCategory});

  factory RealestateModel.fromJson(Map<String, dynamic> json) =>
      RealestateModel(
        id: json["id"],
        createdAt: json["createdAt"],
        title: json["title"],
        ownerType: json["ownerType"],
        ownerName: json["ownerName"],
        ownerImageUrl: json["ownerImageUrl"],
        offerType: json["offerType"],
        lat: json["lat"] != null ? double.parse(json["lat"].toString()) : null,
        lng: json["lng"] != null ? double.parse(json["lng"].toString()) : null,
        price: json["price"] != null
            ? double.parse(json["price"].toString())
            : null,
        area: json["area"] != null ? int.parse(json["area"].toString()) : null,
        views: json["views"],
        imagesCount: json["imagesCount"],
        hasVideo: json["hasVideo"],
        isUrgent: json["isUrgent"],
        age: json["age"],
        noOfRooms: json["noOfRooms"],
        noOfBedRooms: json["noOfBedRooms"],
        noOfBathRooms: json["noOfBathRooms"],
        noOfLivingRooms: json["noOfLivingRooms"],
        noOfFloors: json["noOfFloors"],
        parkingCapacity: json["parkingCapacity"],
        image: json["image"],
        country: json["country"] == null
            ? null
            : DefaultModel.fromJson(json["country"]),
        city: (json["city"] == null || json["city"] is List)
            ? null
            : DefaultModel.fromJson(json["city"]),
        district: json["district"] == null
            ? null
            : DefaultModel.fromJson(json["district"]),
        subDistrict: json["subDistrict"] == null
            ? null
            : DefaultModel.fromJson(json["subDistrict"]),
        category: json["category"] == null
            ? null
            : DefaultModel.fromJson(json["category"]),
        subCategory: json["subCategory"] == null
            ? null
            : DefaultModel.fromJson(json["subCategory"]),
      );
}
