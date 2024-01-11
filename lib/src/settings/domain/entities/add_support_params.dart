import 'package:json_annotation/json_annotation.dart'; 

part 'add_support_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddSupportParams {
  @JsonKey(name: 'subject')
  String? subject;
  @JsonKey(name: 'content')
  String? content;

  AddSupportParams({this.subject, this.content});

   factory AddSupportParams.fromJson(Map<String, dynamic> json) => _$AddSupportParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddSupportParamsToJson(this);
}

