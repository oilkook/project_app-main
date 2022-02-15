import 'package:dio/dio.dart';
import 'package:project_app/config/Urls.dart';
import 'package:project_app/model/bill.dart';

class ActionGet {
  static Dio dio = Dio(BaseOptions(baseUrl: Urls.api));
  static getSheetData() async {
    try {
      final response = await dio.get('');
      if (response.data != null) {
        // print('${response.data}');
        final List<Bill> temp = [];

        // response.data.forEach((item) => temp.add(Bill.fromJson(item)));
        // print(response.data);
        // print(" temp $temp");
        // print(temp.runtimeType);
        return List.generate(response.data.length, (index) => Bill.fromJson(response.data[index]));
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
