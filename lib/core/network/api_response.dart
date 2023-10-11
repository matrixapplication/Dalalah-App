import 'package:delala/core/network/pagination.dart';
import 'package:json_annotation/json_annotation.dart';


part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  bool? status;
  int? code;
  String? message;
  T? data;
  Pagination? pagination;


  ApiResponse({this.status, this.code, this.message, this.data, this.pagination});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) toJsonT,
  ) => _$ApiResponseFromJson(json, toJsonT);
}
