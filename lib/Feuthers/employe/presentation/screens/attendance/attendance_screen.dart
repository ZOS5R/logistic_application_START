import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/app_bar.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Attendance Record'.tr()),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Attendance & Absences This Month'.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatsCard('Absences'.tr(), '2', context),
                _buildStatsCard('Attendance'.tr(), '26', context),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Attendance Log'.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 10.h),
            AttendanceTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(String label, String value, BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        width: 150.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DataTable(
        columnSpacing: 10.w,
        headingRowHeight: 40.h,
        dataRowHeight: 40.h,
        columns: [
          _buildDataColumn('Day'.tr(), context),
          _buildDataColumn('Date'.tr(), context),
          _buildDataColumn('Check-In'.tr(), context),
          _buildDataColumn('Check-Out'.tr(), context),
          _buildDataColumn('Late'.tr(), context),
          _buildDataColumn('Status'.tr(), context),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              _buildDataCell('${index + 1}', context),
              _buildDataCell('2023-03-${index + 1}', context),
              _buildDataCell('08:00', context),
              _buildDataCell('16:00', context),
              _buildDataCell('${index % 3 == 0 ? '10 min' : '-'}', context),
              _buildDataCell(index % 5 == 0 ? 'Absent' : 'Present', context),
            ],
            color: MaterialStateProperty.resolveWith<Color?>((states) {
              return index.isEven ? Colors.grey.shade100 : null;
            }),
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
