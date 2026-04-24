import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/auth/auth_provider.dart';

class SlaughterhouseHomeScreen extends ConsumerWidget {
  const SlaughterhouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slaughterhouse", style: TextStyle(fontSize: 18.sp)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).state = null;
            },
          ),
        ],
      ),

      /// ➕ CREATE BATCH BUTTON
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Create Batch clicked")),
          );
        },
        icon: const Icon(Icons.add),
        label: Text("New Batch", style: TextStyle(fontSize: 12.sp)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 HEADER
              Text(
                "Slaughterhouse Dashboard",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              /// 🔹 KPI
              Row(
                children: [
                  _statCard("Active Batches", "3"),
                  SizedBox(width: 10.w),
                  _statCard("Total Weight", "320kg"),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔹 QUICK ACTIONS
              Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12.h),

              Row(
                children: [
                  _actionCard("New Batch", Icons.add_box),
                  SizedBox(width: 10.w),
                  _actionCard("QC Check", Icons.check_circle),
                  SizedBox(width: 10.w),
                  _actionCard("Upload Docs", Icons.upload),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔹 ACTIVE BATCHES
              Text(
                "Active Batches",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12.h),

              Column(
                children: [
                  _batchItem("#PK-221", "120kg", "Processed"),
                  _batchItem("#PK-222", "95kg", "Pending QC"),
                  _batchItem("#PK-223", "150kg", "In Progress"),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔹 QC CHECKLIST
              Text(
                "QC Checklist",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              _qcItem("Weight Verified"),
              _qcItem("Halal Certified"),
              _qcItem("Temperature OK"),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 KPI CARD
  Widget _statCard(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(title, style: TextStyle(fontSize: 12.sp)),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 ACTION CARD
  Widget _actionCard(String title, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            children: [
              Icon(icon, size: 26.sp),
              SizedBox(height: 6.h),
              Text(title, style: TextStyle(fontSize: 12.sp)),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 BATCH ITEM
  Widget _batchItem(String id, String weight, String status) {
    final isPending = status.contains("Pending");

    return Card(
      child: ListTile(
        title: Text(id, style: TextStyle(fontSize: 14.sp)),
        subtitle: Text(
          "Weight: $weight",
          style: TextStyle(fontSize: 12.sp),
        ),
        trailing: Text(
          status,
          style: TextStyle(
            fontSize: 12.sp,
            color: isPending ? Colors.orange : Colors.green,
          ),
        ),
      ),
    );
  }

  /// 🔹 QC ITEM
  Widget _qcItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8.w),
          Text(text, style: TextStyle(fontSize: 13.sp)),
        ],
      ),
    );
  }
}