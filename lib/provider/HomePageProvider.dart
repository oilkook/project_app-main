import 'package:flutter/material.dart';
import 'package:project_app/actions/ActionGet.dart';
import 'package:project_app/model/bill.dart';

class HomePageProvider extends ChangeNotifier {
  List<Bill> requestedStatus = [];
  List<Bill> repairConfirm = [];

  int noti_count = 0;
  int diff = 0;

  fetchRequestStatus() async {
    final List<Bill> res = await ActionGet.getSheetData();



    print('res prov ${res.length}');
    
    res.sort(
        (Bill a, Bill b) => b.id.compareTo(a.id));

    final List<Bill> msg_0 =
        res.where((element) => element.msg == "0").toList();

        
    this.requestedStatus = msg_0;
    notifyListeners();
  }

  fetchConfirmStatus() async {
    final List<Bill> res = await ActionGet.getSheetData();

    res.sort(
        (Bill a, Bill b) => b.informationDate.compareTo(a.informationDate));
    final List<Bill> msg_1 =
        res.where((element) => element.msg == "1").toList();
    this.repairConfirm = msg_1;
    notifyListeners();
  }
  clearCount() {
    this.noti_count = 0;
    notifyListeners();
  }
}
