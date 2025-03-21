import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_app/core/widgets/spacing.dart';

Widget buildInfoGrid(BuildContext context) {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Personal Information',
      'icon': Icons.person,
      'path': '/personalInfo'
    },
    {
      'title': 'Contact Information',
      'icon': Icons.contact_phone,
      'path': '/contactInfo'
    },
    {
      'title': 'Performance and Credit Statistics',
      'icon': Icons.bar_chart,
      'path': '/performanceStats'
    },
    {'title': 'Job Information', 'icon': Icons.business, 'path': '/jobInfo'},
    {
      'title': 'Evaluations and Performance',
      'icon': Icons.star,
      'path': '/evaluations'
    },
    {
      'title': 'Attendance and Departure Record',
      'icon': Icons.access_time,
      'path': '/attendance'
    },
    {'title': 'Requests', 'icon': Icons.list, 'path': '/requests'},
    {
      'title': 'Points and Rewards',
      'icon': Icons.gamepad,
      'path': '/pointsRewards'
    },
  ];

  return GridView.builder(
    padding: EdgeInsets.all(16.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      return buildInfoCard(items[index]['title'], items[index]['icon'],
          items[index]['path'], context);
    },
  );
}

Widget buildInfoCard(
    String title, IconData icon, String path, BuildContext context) {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: InkWell(
      onTap: () {
        context.go(path);
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.5),
              Theme.of(context).colorScheme.primary.withOpacity(0.8)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            const SpaceH(num: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
