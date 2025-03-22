import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/app_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Performance & Evaluations".tr(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEvaluationCard('Overall Rating'.tr(), 0.70, context),
                _buildEvaluationCard('Monthly Rating'.tr(), 0.90, context),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Previous Evaluations'.tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => _buildEvaluationCardDetail(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvaluationCard(
      String title, double percentage, BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 50,
            lineWidth: 8,
            percent: percentage,
            center: Text("${(percentage * 100).toInt()}%"),
            progressColor: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationCardDetail() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evaluation Date:'.tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildEvaluationRow('Punctuality'.tr(), 'Excellent'),
          _buildEvaluationRow('Engagement & Communication'.tr(), 'Very Good'),
          _buildEvaluationRow('Behavior & Ethics'.tr(), 'Excellent'),
          _buildEvaluationRow('Areas of Improvement'.tr(), 'Needs Enhancement'),
          _buildEvaluationRow(
              'Supervisor Notes'.tr(), 'Better communication required'),
        ],
      ),
    );
  }

  Widget _buildEvaluationRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.blue.shade700),
          ),
        ],
      ),
    );
  }
}
