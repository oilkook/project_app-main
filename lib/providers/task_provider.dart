import 'package:flutter/material.dart';
import 'package:project_app/models/repair_request.dart';
import 'package:project_app/utils/api.dart';

class TaskProvider extends ChangeNotifier {
  TaskProvider();
  List<RepairRequest> repairTasks = [];
   Future<bool> loadTask() async {
     print('[TaskProvider] : Load Task');
    final result = await Api.getOrderRequest();
    this.repairTasks = result;
    notifyListeners();
    print('[TaskProvider] : Load Task Completed');
    return true;
  }

  List<RepairRequest> getTaskByMsg(int msg) {
    final results = repairTasks.where((task) => task.msg == msg.toString());
    return results;
  }
}
