import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/config/Urls.dart';
import 'package:project_app/model/bill.dart';
import 'package:project_app/provider/HomePageProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActionGet {
  static Dio dio = Dio(BaseOptions(baseUrl: Urls.api));
  static getSheetData({BuildContext context}) async {
    try {
      final response = await dio.get('');
      if (response.data != null) {
        // print('${response.data}');
        final List<Bill> temp = [];

        // response.data.forEach((item) => temp.add(Bill.fromJson(item)));
        // print(response.data);
        // print(" temp $temp");
        // print(temp.runtimeType);

        final SharedPreferences local = await SharedPreferences.getInstance();
        if (context != null) {
          if (local.getInt('count') == null) {
            local.setInt('count', response.data.length);
            print('${local.getInt('count')}');
          } else {
            print('diff : ${response.data.length - local.getInt('count')}');
            final provider = Provider.of<HomePageProvider>(context, listen: false);
            provider.noti_count = response.data.length - local.getInt('count');
            provider.diff = response.data.length - local.getInt('count');

          }
        }

        return List.generate(response.data.length,
            (index) => Bill.fromJson(response.data[index]));
      } else {
        print('Data is Null');
      }
    } on DioError catch (err) {
      print(err);
      return 'Error';
    }
  }
}

/*

*/
