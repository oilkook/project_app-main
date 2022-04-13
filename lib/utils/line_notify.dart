import 'package:dio/dio.dart';
import 'package:project_app/configs/global.dart';

class LineNotify {
  static Dio dio = Dio(BaseOptions(
      baseUrl: "https://notify-api.line.me/api/notify",
      connectTimeout: 1000 * 5,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $lineNotifyAccessToken'
      }));

  static send({String message}) async {
    var form = FormData.fromMap({"message": message});
    try {
      final res = await dio.post(
        '',
        data: form,
      );

      print("[Line Notify] - ${res.statusCode} ${res.statusMessage}");
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (err) {
      print("[Line Notify] - ${err.message}");
      return false;
    }
  }
}
