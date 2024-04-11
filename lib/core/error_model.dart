import 'package:freezed_annotation/freezed_annotation.dart';



part 'error_model.g.dart';
@JsonSerializable()
class ErrorModel {
  String? statusCode;
  String? statusMessage;

  ErrorModel({this.statusCode, this.statusMessage});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    return data;
  }
}
