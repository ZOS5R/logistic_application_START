import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'requests'.tr(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () => context.pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          dividerHeight: 0,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          indicatorWeight: 6,
          tabs: [
            Tab(text: 'Holidays'.tr()),
            Tab(text: 'Advance'.tr()),
            Tab(text: 'Overtime'.tr()),
            Tab(text: 'Work leave'.tr()),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRequestsList(),
          _buildRequestsList(),
          _buildRequestsList(),
          _buildRequestsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddRequestDialog(context);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }

  Widget _buildRequestsList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildRequestCard('pending'.tr(), Colors.amber, '2024/10/22',
              '2024/11/22', '31 ${'days'.tr()}'),
          _buildRequestCard('approved'.tr(), Colors.green, '2024/10/22',
              '2024/11/22', '31 ${'days'.tr()}'),
          _buildRequestCard('rejected'.tr(), Colors.red, '2024/10/22',
              '2024/11/22', '31 ${'days'.tr()}'),
        ],
      ),
    );
  }

  Widget _buildRequestCard(String status, Color statusColor, String startDate,
      String endDate, String duration) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle card tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'start date'.tr() + ': $startDate',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'end date'.tr() + ': $endDate',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "since ${duration}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAddRequestDialog(BuildContext context) {
  String selectedRequestType = 'Holidays';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  DateTimeRange? selectedDateRange;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text('Add Request'.tr(), textAlign: TextAlign.center),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedRequestType,
                    decoration: InputDecoration(
                      labelText: 'Request Type'.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: ['Holidays', 'Advance', 'Overtime', 'Work leave']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type.tr()),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRequestType = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  if (selectedRequestType == 'Holidays' ||
                      selectedRequestType == 'Work leave')
                    _buildDateRangePicker(context, setState, selectedDateRange),
                  if (selectedRequestType == 'Advance')
                    _buildAmountField(_amountController),
                  if (selectedRequestType == 'Overtime')
                    _buildOvertimeFields(context, _hoursController),
                  if (selectedRequestType == 'Work leave')
                    _buildReasonField(_reasonController),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel'.tr(),
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary, // Use secondary color for cancel
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle submission logic (validation can be added here)
                  Navigator.pop(context);
                },
                child: Text('Submit'.tr()),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

Widget _buildDateRangePicker(BuildContext context, StateSetter setState,
    DateTimeRange? selectedDateRange) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Select Dates'.tr(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () async {
        DateTimeRange? picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          setState(() {
            selectedDateRange = picked;
          });
        }
      },
      controller: TextEditingController(
        text: selectedDateRange == null
            ? ''
            : '${selectedDateRange!.start.toLocal().toString().split(' ')[0]} - ${selectedDateRange!.end.toLocal().toString().split(' ')[0]}',
      ),
    ),
  );
}

Widget _buildAmountField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Amount Needed'.tr(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget _buildOvertimeFields(
    BuildContext context, TextEditingController hoursController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: hoursController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Number of Hours'.tr(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      const SizedBox(height: 16),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Date'.tr(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            hoursController.text =
                pickedDate.toLocal().toIso8601String().split('T')[0];
          }
        },
      ),
    ],
  );
}

Widget _buildReasonField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: 'Reason'.tr(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
    ),
    minLines: 3,
    maxLines: 5,
  );
}
