import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/app_bar.dart';
import 'package:logistic_app/core/widgets/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class StatisticsStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Performance Statistics',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatsCard('Achievements'.tr(), '2', context),
                _buildStatsCard('Points Balance'.tr(), '1320', context),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Overtime Hours:'.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 20),
            Text(
              'Attendance Summary (Days for this Month)'.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 10),
            Expanded(child: CustomDataTable()),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(String label, String value, BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: 150.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 22.w,
        border: TableBorder.all(color: Colors.grey.shade300),
        columns: [
          _buildDataColumn('Day'.tr(), context),
          _buildDataColumn('Date'.tr(), context),
          _buildDataColumn('Check-in'.tr(), context),
          _buildDataColumn('Check-out'.tr(), context),
          _buildDataColumn('Status'.tr(), context),
        ],
        rows: List.generate(
          5,
          (index) => DataRow(
            cells: [
              _buildDataCell('${index + 1}', context),
              _buildDataCell('2023-03-${index + 1}', context),
              _buildDataCell('08:00', context),
              _buildDataCell('16:00', context),
              _buildDataCell('Present', context),
            ],
            color: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return index.isEven ? Colors.grey.shade100 : null;
              },
            ),
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(String label, BuildContext context) {
    return DataColumn(
      label: Expanded(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  DataCell _buildDataCell(String text, BuildContext context) {
    return DataCell(
      Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
