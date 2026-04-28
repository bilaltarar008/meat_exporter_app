import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/auth/auth_provider.dart';

class SlaughterhouseHomeScreen extends ConsumerWidget {
  const SlaughterhouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slaughterhouse", style: TextStyle(fontSize: 18.sp, color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.red,
            iconSize: 30.0,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),

      /// ➕ MAIN ACTION
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Create Batch")),
          );
        },
        icon: const Icon(Icons.add, color: Colors.black,),
        label: const Text("New Batch"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 HEADER
              Text(
                "Operations Dashboard",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              /// 🔹 KPI
              Row(
                children: [
                  _kpi("Active Batches", "3"),
                  SizedBox(width: 10.w),
                  _kpi("Total Weight", "320kg"),
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

              SizedBox(height: 10.h),

              Row(
                children: [
                  _action(context, "New Batch", Icons.add_box),
                  SizedBox(width: 8.w),
                  _action(context, "QC Check", Icons.check_circle),
                  SizedBox(width: 8.w),
                  _action(context, "Upload Docs", Icons.upload),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔹 QC STATUS
              Text(
                "QC Status",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              _qcItem("Temperature OK"),
              _qcItem("Hygiene OK"),

              SizedBox(height: 20.h),

              /// 🔹 ACTIVE BATCHES
              Text(
                "Active Batches",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              _batch("#PK-221", "120kg", "Processed"),
              _batch("#PK-222", "95kg", "Pending"),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 KPI CARD
  Widget _kpi(String title, String value) {
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
  Widget _action(BuildContext context, String title, IconData icon) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(title)),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              children: [
                Icon(icon, size: 26.sp),
                SizedBox(height: 6.h),
                Text(title, style: TextStyle(fontSize: 12.sp)),
              ],
            ),
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

  /// 🔹 BATCH ITEM
  Widget _batch(String id, String weight, String status) {
    final isPending = status.toLowerCase().contains("pending");

    return Card(
      child: ListTile(
        title: Text(id),
        subtitle: Text("Weight: $weight"),
        trailing: Text(
          status,
          style: TextStyle(
            color: isPending ? Colors.orange : Colors.green,
          ),
        ),
      ),
    );
  }
}