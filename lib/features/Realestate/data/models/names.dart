import '../../../../core/data_source/model.dart';

class NamesModel extends BaseModel {
  String? enUS;
  String? arIQ;
  String? kuIQ;

  NamesModel({this.enUS, this.arIQ, this.kuIQ});

  factory NamesModel.fromJson(Map<String, dynamic> json) => NamesModel(
        enUS: json['en-US'],
        arIQ: json['ar-IQ'],
        kuIQ: json['ku-IQ'],
      );

  Map<String, dynamic> toJson() => {
        'en-US': enUS,
        'ar-IQ': arIQ,
        'ku-IQ': kuIQ,
      };
}