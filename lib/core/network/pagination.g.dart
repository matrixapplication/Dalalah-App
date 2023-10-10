// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: json['current_page'] as int?,
      firstPageUrl: json['first_page_url'] as String?,
      prevPageUrl: json['prev_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      lastPageUrl: json['last_page_url'] as String?,
      totalPages: json['total_pages'] as int?,
      perPage: json['per_page'] as int?,
      totalItems: json['total_items'] as int?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'first_page_url': instance.firstPageUrl,
      'prev_page_url': instance.prevPageUrl,
      'next_page_url': instance.nextPageUrl,
      'last_page_url': instance.lastPageUrl,
      'total_pages': instance.totalPages,
      'per_page': instance.perPage,
      'total_items': instance.totalItems,
      'path': instance.path,
    };
