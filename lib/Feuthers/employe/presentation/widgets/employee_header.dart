import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildProfileHeader(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.0),
    color: Theme.of(context).colorScheme.primary,
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Icon(
            Icons.person,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('اسم الموظف',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.surface)),
              Text('المسمى الوظيفي',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.surface)),
              Text('رقم الموظف والقسم الذي يعمل به',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.surface)),
            ],
          ),
        ),
      ],
    ),
  );
}
