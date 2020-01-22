// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map<String, dynamic> json) {
  return App(
    id: json['id'] as int,
    appLogo: json['app_logo'] as String,
    appName: json['app_name'] as String,
    appDescription: json['app_description'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
      'id': instance.id,
      'app_logo': instance.appLogo,
      'app_name': instance.appName,
      'app_description': instance.appDescription,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
