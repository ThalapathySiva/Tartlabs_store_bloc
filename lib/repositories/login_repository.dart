import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tartlabs_store_bloc/constants/constants.dart';
import 'package:tartlabs_store_bloc/models/token.dart';

class LoginRepository {
  static Future<Token> authenticate({
    @required String username,
    @required String password,
  }) async {
    final Map<String, dynamic> authData = {
      "username": username,
      "password": password,
      "client_id": CLIENT_ID,
      "client_secret": CLIENT_SECERET,
      "grant_type": GRANT_TYPE,
      "providers": PROVIDERS
    };
    Dio dio = new Dio();
    final String url = BASE_URL + '/oauth/token';
    Token token;
    final response = await dio.post(
      '$url',
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ),
      data: json.encode(authData),
    );
    if (response.statusCode <= 200 || response.statusCode < 400) {
      var result = response.data;
      print(result);
      var responseData = Token.fromJson(result);
      token = responseData;
    } else {
      print("error");
    }
    await Future.delayed(Duration(seconds: 1));
    return token;
  }
}
