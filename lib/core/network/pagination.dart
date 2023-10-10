import 'package:json_annotation/json_annotation.dart'; 

part 'pagination.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class Pagination {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  @JsonKey(name: 'prev_page_url')
  String? prevPageUrl;
  @JsonKey(name: 'next_page_url')
  String? nextPageUrl;
  @JsonKey(name: 'last_page_url')
  String? lastPageUrl;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'total_items')
  int? totalItems;
  @JsonKey(name: 'path')
  String? path;

  Pagination({this.currentPage, this.firstPageUrl, this.prevPageUrl, this.nextPageUrl, this.lastPageUrl, this.totalPages, this.perPage, this.totalItems, this.path});

   factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

   Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

