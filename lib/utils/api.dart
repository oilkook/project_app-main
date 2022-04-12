import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_app/configs/global.dart';
import 'package:project_app/models/repair_request.dart';

class Api {
  static Dio dio = Dio(BaseOptions(
    baseUrl: base_url,
    connectTimeout: 1000 * 10,
  ));
  static getOrderRequest() async {
    List<RepairRequest> list = [];
    try {
      final result = await dio.get('');
      if (result.statusCode == 200) {
        list = List.generate(result.data.length,
            (index) => RepairRequest.fromJson(result.data[index]));
        return list;
      } else {
        return false;
      }
    } on DioError catch (err) {
      print(err.message);
      return false;
    }
  }
}
