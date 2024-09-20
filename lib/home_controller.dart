import 'package:example_test/models/employee.dart';
import 'package:example_test/employee_service.dart';
import 'package:example_test/models/month_entry.dart';
import 'package:flutter/material.dart';

final class HomeController extends ChangeNotifier {
  bool isLoading = false;
  List<Employee> employees = [];
  List<int> months = [];
  Map<int, MonthEntry> data = {};

  final EmployeeService service = EmployeeService();

  HomeController();

  void loadData() async {
    final response = await service.get();

    employees = (response['employees'] as List).map((e) {
      return Employee.fromJson(e);
    }).toList();

    groupByDate();
    notifyListeners();
  }

  void groupByDate() {
    for (var employee in employees) {
      final empMonth = employee.dateOfEmployment.month;
      final dobMonth = employee.dateOfBirth.month;

      var monthEvent = data[empMonth];
      if (monthEvent == null) {
        data[empMonth] = MonthEntry.create(employee.dateOfEmployment, employee);
      } else {
        monthEvent.addEvent(employee.dateOfEmployment, employee);
        data[empMonth] = monthEvent;
      }

      monthEvent = data[dobMonth];
      if (monthEvent == null) {
        data[dobMonth] = MonthEntry.create(employee.dateOfBirth, employee);
      } else {
        monthEvent.addEvent(employee.dateOfBirth, employee);
        data[dobMonth] = monthEvent;
      }

      data[dobMonth]?.days.sort();
      data[empMonth]?.days.sort();
    }

    months = data.keys.toList();
    months.sort();

    final index = months.indexOf(DateTime.now().month);
    months = months.sublist(index) + months.sublist(0, index);
  }
}
