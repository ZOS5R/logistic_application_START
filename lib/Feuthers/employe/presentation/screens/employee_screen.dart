import 'package:flutter/material.dart';
import 'package:logistic_app/Feuthers/employe/presentation/widgets/employee_header.dart';
import 'package:logistic_app/Feuthers/employe/presentation/widgets/employee_info.dart';

class EmployeeHome extends StatelessWidget {
  const EmployeeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildProfileHeader(context),
            Expanded(child: buildInfoGrid(context)),
          ],
        ),
      ),
    );
  }
}
