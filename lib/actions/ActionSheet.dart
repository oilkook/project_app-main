import 'package:gsheets/gsheets.dart';
import 'package:project_app/config/Config.dart';

class ActionSheet {
  static editStatus({
    String id,
    String status,
  }) async {
    final gsheets = GSheets(Config.credentials);
    final sheet = await gsheets.spreadsheet(Config.spreadsheetId);
    final res = await sheet.worksheetByTitle('From').values.insertValueByKeys(
          status,
          columnKey: 'status',
          rowKey: id,
          eager: false,
        );

    print('result $res');
  }
}
