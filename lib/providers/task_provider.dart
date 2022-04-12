import 'package:flutter/material.dart';
import 'package:project_app/models/repair_request.dart';
import 'package:project_app/utils/api.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider();
  List<RepairRequest> reported = [];
  List<RepairRequest> confirmed = [];
  List<RepairRequest> finished = [];

  Future<bool> loadTask() async {
    print('[TaskProvider] : Load Task');
    try {
      final List<RepairRequest> result = await Api.getOrderRequest();
      this.reported = result.where((task) => task.msg == "0").toList();
      this.confirmed = result.where((task) => task.msg == "1").toList();
      this.finished = result.where((task) => task.msg == "2").toList();
      notifyListeners();
      print('[TaskProvider] : Load Completed');
      print('[TaskProvider] : Reported = ${this.reported.length}');
      print('[TaskProvider] : Comfirmed = ${this.confirmed.length}');
      print('[TaskProvider] : Finish = ${this.finished.length}');

      return true;
    } catch (err) {
      print('[TaskProvider] : Load Failed');
      print(err);
      return false;
    }
  }
}
