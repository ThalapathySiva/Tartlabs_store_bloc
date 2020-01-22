// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    tokenType: json['token_type'] as String,
    expiresIn: json['expires_in'] as int,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
