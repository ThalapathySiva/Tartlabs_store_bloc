import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tartlabs_store_bloc/constants/constants.dart';
import 'package:tartlabs_store_bloc/models/app.dart';
import 'package:tartlabs_store_bloc/models/token.dart';
import 'package:tartlabs_store_bloc/utils/preference_helper.dart';

class AppListRepository {
  static Future<List<App>> getAppList() async {
    try {
      Dio dio = new Dio();
      final String url = BASE_URL + '/api/v1/client/apps';
      final Token token = await PreferenceHelper.getToken();
      final response = await dio.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer " + token.accessToken
        }),
      );

      if (response.statusCode <= 200 || response.statusCode < 400) {
        var result = response.data;
        print((result)["apps"]);
        List applist = result["apps"];
        List<App> apps;
        apps = applist.map((f) => App.fromJson(f)).toList();
        return apps;
      } else {
        throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
