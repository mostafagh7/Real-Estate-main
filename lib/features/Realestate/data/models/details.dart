import 'package:real_estate/features/Realestate/data/models/model.dart';
import '../../../../core/data_source/model.dart';

class RealestateDetailsModel extends BaseModel {
  String? id;
  // String? createdAt;
  // String? updatedAt;
  DefaultModel? country;
  DefaultModel? city;
  DefaultModel? district;
  DefaultModel? subDistrict;
  DefaultModel? category;
  DefaultModel? subCategory;
  // String? ownerType;
  // String? subScriptionPlanId;
  // String? status;
  // String? phoneNumber;
  int? area;
  double? price;
  // String? posterUrl;
  // String? realestateGroup;
  // String? realestateSample;
  // bool? isFavorite;
  String? title;
  // String? description;
  // String? nearestPoint;
  // String? commName;
  // String? fullAddress;
  // String? avenueName;
  // int? streetNo;
  // int? districtNo;
  // double? lng;
  // double? lat;
  int? views;
  // bool? isSold;
  // bool? isPublished;
  // bool? isAddedFromDashboard;
  // String? expiresAt;
  List<String>? images;
  // String? video;
  String? offerType;
  // String? payType;
  // String? ownershipType;
  // String? installmentDetails;
  // List<String>? features;
  // int? age;
  // int? noOfRooms;
  int? noOfBedRooms;
  int? noOfBathRooms;
  // int? noOfLivingRooms;
  // int? noOfFloors;
  // int? noOfApartments;
  // int? parkingCapacity;
  // double? frontageWidth;
  // double? frontageDepth;
  // double? constructionArea;
  // double? gardenArea;
  // String? flooringType;
  // String? claddingType;
  // String? windowType;
  // String? nearbyType;
  // String? facingDirection;
  // String? residencyType;
  // bool? forGender;
  // String? blockNumber;
  // String? buildingNumber;
  // int? floorNumber;
  // int? flatNumber;
  // int? noOfUnits;
  // int? similarRealestatesCount;

  RealestateDetailsModel({
    this.id,
    this.country,
    this.city,
    this.district,
    this.subDistrict,
    this.category,
    this.subCategory,
    this.area,
    this.price,
    this.title,
    this.views,
    this.images,
    this.offerType,
    this.noOfBedRooms,
    this.noOfBathRooms,
  });

  factory RealestateDetailsModel.fromJson(Map<String, dynamic> json) => RealestateDetailsModel(
    id: json["id"],
    country: json["country"] != null ? DefaultModel.fromJson(json["country"]) : null,
    city: json["city"] != null ? DefaultModel.fromJson(json["city"]) : null,
    district: json["district"] != null ? DefaultModel.fromJson(json["district"]) : null,
    subDistrict: json["subDistrict"] != null ? DefaultModel.fromJson(json["subDistrict"]) : null,
    category: json["category"] != null ? DefaultModel.fromJson(json["category"]) : null,
    subCategory: json["subCategory"] != null ? DefaultModel.fromJson(json["subCategory"]) : null,
    area: json["area"],
    price: json["price"] != null ? double.parse(json["price"].toString()) : null,
    title: json["title"],
    views: json["views"],
    images: json["images"] != null ? List<String>.from(json["images"]) : null,
    offerType: json["offerType"],
    noOfBedRooms: json["noOfBedRooms"],
    noOfBathRooms: json["noOfBathRooms"],
  );
}
