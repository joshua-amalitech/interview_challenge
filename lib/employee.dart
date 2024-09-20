import 'package:example_test/extension.dart';

final class Employee {
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final DateTime dateOfEmployment;

  const Employee({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.dateOfEmployment,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      firstName: json["firstname"],
      lastName: json["lastname"],
      dateOfBirth: DateTime.parse(json["dateofbirth"]),
      dateOfEmployment: DateTime.parse(json["yearofemployment"]),
    );
  }

  int get yearsOfEmployment {
    return DateTime.now().year - dateOfEmployment.year;
  }

  String get name {
    return "$firstName $lastName";
  }

  String get displayDob {
    return "${dateOfBirth.month}/${dateOfBirth.day}";
  }

  String get displayEmpDate {
    return "${dateOfEmployment.month}/${dateOfEmployment.day}";
  }

  int get age {
    return DateTime.now().year - dateOfBirth.year;
  }
}
