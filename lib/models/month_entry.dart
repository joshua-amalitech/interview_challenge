import 'package:example_test/models/employee.dart';
import 'package:example_test/extension.dart';

class MonthEntry {
  String name;
  int number;
  List<int> days;
  Map<int, List<Employee>> events;

  MonthEntry({
    required this.name,
    required this.number,
    required this.days,
    required this.events,
  });

  void addEvent(DateTime date, Employee employee) {
    final month = date.month;
    final day = date.day;

    name = month.parseMonth();
    number = month;
    days.add(day);

    final tmpEvents = events[day] ?? [];
    tmpEvents.add(employee);
    events[day] = tmpEvents;
  }

  factory MonthEntry.create(DateTime date, Employee employee) {
    return MonthEntry(
      name: date.month.parseMonth(),
      number: date.month,
      days: [date.day],
      events: {
        date.day: [employee]
      },
    );
  }
}
