import 'package:example_test/extension.dart';
import 'package:example_test/home_controller.dart';
import 'package:flutter/material.dart';

import 'employee.dart';

class HomeScreen extends StatefulWidget {
  final HomeController controller;

  const HomeScreen({
    super.key,
    required this.controller,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
    widget.controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...widget.controller.months.map((month) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            month.parseMonth(),
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        _buildCardList(month, theme),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildCardList(int month, ThemeData theme) {
    final employees = widget.controller.data[month] ?? [];

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: employees.length,
      itemBuilder: (context, index) {
        Employee employee = employees[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  "https://ca.slack-edge.com/T017QJT2H7G-U04EMHNTCQY-a04f65bd5ee6-512",
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, trace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              title: Text(
                employee.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 20.0,
                ),
              ),
              subtitle: _buildSubtitle(month, employee),
              trailing: _buildTrailing(DateTime.now()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubtitle(int month, Employee employee) {
    final monthDob = employee.dateOfBirth.month;
    final empYears = employee.yearsOfEmployment;

    Icon icon = const Icon(
      Icons.favorite_rounded,
      color: Colors.red,
    );
    String subtitle = "$empYears${empYears.suffix()} Company Anniversary";

    if (month == monthDob) {
      icon = const Icon(
        Icons.celebration_rounded,
        color: Colors.green,
      );
      subtitle = "Birthday on ${employee.displayDob}";
    }

    return Row(
      children: [
        icon,
        const SizedBox(width: 8.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTrailing(DateTime date) {
    if (date.isAtSameMomentAs(DateTime.now())) {
      return const Icon(Icons.celebration);
    }

    final days = DateUtils.getDaysInMonth(DateTime.now().year, date.month);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          (days - date.day).toString(),
          style: const TextStyle(fontSize: 20.0),
        ),
        const Text("Days"),
      ],
    );
  }
}
