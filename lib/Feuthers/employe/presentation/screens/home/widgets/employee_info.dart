import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Make sure this is imported for navigation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistic_app/core/router/rotue_names.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildInfoGrid(BuildContext context) {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'My profile'.tr(),
      'icon': Icons.person_outline,
      'path': RouteNames.personalInfo
    },
    {
      'title': 'Contact Information'.tr(),
      'icon': Icons.mail_outline,
      'path': RouteNames.contactInfo
    },
    {
      'title': 'Performance Statistics'.tr(),
      'icon': Icons.assessment,
      'path': RouteNames.statistics
    },
    {
      'title': 'Job Information'.tr(),
      'icon': Icons.work_outline,
      'path': RouteNames.jobInfo
    },
    {
      'title': 'Rating and Performance'.tr(),
      'icon': Icons.check_circle_outline,
      'path': RouteNames.performanceStats
    },
    {
      'title': 'Attendance'.tr(),
      'icon': Icons.schedule,
      'path': RouteNames.attendance
    },
    {
      'title': 'Requests'.tr(),
      'icon': Icons.assignment,
      'path': RouteNames.requests
    },
    {
      'title': 'Points and Rewards'.tr(),
      'icon': Icons.local_offer,
      'path': RouteNames.pointsRewards
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
        context.push(path);
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
              color: Theme.of(context).colorScheme.surface,
            ),
            const SizedBox(height: 10), // Replace SpaceH with SizedBox
            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.surface)),
          ],
        ),
      ),
    ),
  );
}
