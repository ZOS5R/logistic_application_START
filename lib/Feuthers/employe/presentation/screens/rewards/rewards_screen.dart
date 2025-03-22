import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/app_bar.dart';
import 'package:logistic_app/core/router/rotue_names.dart';
import 'package:logistic_app/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class PointsRewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeHelper = ThemeHelper(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'points wallet'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Points Section
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    themeHelper.colors.primary,
                    themeHelper.colors.primaryContainer
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'points'.tr(),
                    style: themeHelper.theme.textTheme.titleMedium!.copyWith(
                      color: themeHelper.colors.secondary,
                    ),
                  ),
                  Text(
                    '1,240',
                    style: themeHelper.theme.textTheme.headlineSmall!.copyWith(
                      color: themeHelper.colors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Exchange History
            Text(
              'exchange history'.tr(),
              style: themeHelper.theme.textTheme.titleMedium!.copyWith(
                color: themeHelper.colors.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),

            // Exchange History Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  // Status Box
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'accepted'.tr(),
                        style:
                            themeHelper.theme.textTheme.titleMedium!.copyWith(
                          color: themeHelper.colors.surface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Exchange Details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${'points used'.tr()}: 500',
                            style: themeHelper.theme.textTheme.bodyLarge,
                          ),
                          Text(
                            '${'reward'.tr()}: ${'extra leave'.tr()}',
                            style: themeHelper.theme.textTheme.bodyLarge,
                          ),
                          Text(
                            '${'date'.tr()}: 10-11-2024 (${'duration'.tr()} ٣ ${'days'.tr()})',
                            style: themeHelper.theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Exchange Button
            GestureDetector(
              onTap: () {
                context.push(RouteNames.exchange);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: themeHelper.colors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: themeHelper.colors.primary,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'exchange'.tr(),
                    style: themeHelper.theme.textTheme.titleMedium!.copyWith(
                      color: themeHelper.colors.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
