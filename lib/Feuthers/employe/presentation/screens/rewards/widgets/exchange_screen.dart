import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/app_bar.dart';
import 'package:logistic_app/core/widgets/spacing.dart';

class ExchangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: CustomAppBar(title: 'available benefits'.tr()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pointsCard(context, colors),
            const SpaceH(
              num: 20,
            ),
            _benefitCard(
              context,
              title: '3 extra leave'.tr(),
              points: '500 ${'points required'.tr()}',
              details: 'leave_details'.tr(),
              colors: colors,
            ),
            const SpaceH(
              num: 16,
            ),
            _benefitCard(
              context,
              title: 'food voucher'.tr(),
              points: '500 ${'points required'.tr()}',
              details: 'voucher_details'.tr(),
              colors: colors,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pointsCard(BuildContext context, ColorScheme colors) {
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('your points'.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colors.surface,
                      fontWeight: FontWeight.bold,
                    )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('1,240',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colors.onSecondary,
                        fontWeight: FontWeight.bold,
                      )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _benefitCard(BuildContext context,
      {required String title,
      required String points,
      required String details,
      required ColorScheme colors}) {
    return Container(
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'required points'.tr()}: $points',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SpaceH(
                  num: 10,
                ),
                Text(
                  details,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface.withOpacity(0.7),
                      ),
                ),
                const SpaceH(
                  num: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
