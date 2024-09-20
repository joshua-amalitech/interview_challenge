import 'package:example_test/employee.dart';
import 'package:example_test/employee_service.dart';
import 'package:example_test/extension.dart';
import 'package:flutter/cupertino.dart';

final class HomeController extends ChangeNotifier {
  bool isLoading = false;
  List<Employee> employees = [];
  Map<int, List<Employee>> data = {};
  List<int> months = [];

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
      final empDate = employee.dateOfEmployment.month;
      final dobDate = employee.dateOfBirth.month;

      var categoryData = data[empDate] ?? [];
      categoryData.add(employee);
      data[empDate] = categoryData;

      categoryData = data[dobDate] ?? [];
      categoryData.add(employee);
      data[dobDate] = categoryData;
    }

    months = data.keys.toList();
    months.sort();
  }
}
