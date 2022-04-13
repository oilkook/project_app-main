import 'package:gsheets/gsheets.dart';

import '../configs/global.dart';

class ActionGoogleSheet {
  static editStatus({
    String id,
    String status,
  }) async {
    try {
      print('[Sheet] - Edit Status');
      final gsheets = GSheets(credentials);
      final sheet = await gsheets.spreadsheet(spreadsheetId);
      final res = await sheet.worksheetByTitle('From').values.insertValueByKeys(
            status,
            columnKey: 'status',
            rowKey: id,
            eager: false,
          );
      print('[Sheet] - $res');
      return true;
    } catch (err) {
      print('[Sheet] - $err');
      return false;
    }
  }
}
