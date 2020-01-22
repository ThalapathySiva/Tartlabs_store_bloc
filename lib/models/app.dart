import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';

@JsonSerializable()
class App {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'app_logo')
  String appLogo;
  @JsonKey(name: 'app_name')
  String appName;
  @JsonKey(name: 'app_description')
  String appDescription;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  App({
    this.id,
    this.appLogo,
    this.appName,
    this.appDescription,
    this.createdAt,
    this.updatedAt,
  });

  factory App.fromJson(Map<String, dynamic> map) => _$AppFromJson(map);
  Map<String, dynamic> toJson() => _$AppToJson(this);
}
