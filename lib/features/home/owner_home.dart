import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/auth/auth_provider.dart';
import '../../core/database/database_provider.dart';
import '../../core/database/app_database.dart';

class OwnerHomeScreen extends ConsumerWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(fontSize: 18.sp)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).state = null;
            },
          ),
        ],
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔹 HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome, Onwer",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    const Icon(Icons.notifications),
                  ],
                ),

                SizedBox(height: 20.h),

                /// 🔹 KPI GRID
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  children: const [
                    KPIBox(title: "Active", value: "12"),
                    KPIBox(title: "In Transit", value: "5"),
                    KPIBox(title: "Delivered", value: "20"),
                    KPIBox(title: "Alerts", value: "2"),
                  ],
                ),

                SizedBox(height: 20.h),

                /// 🔹 ACTION BUTTON

                SizedBox(height: 20.h),

                /// 🔹 SHIPMENTS LIST (NO EXPANDED)
                _buildShipmentList(ref),

                SizedBox(height: 20.h),

                /// 🔹 ALERTS
                Text("Alerts",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: const Text("Temperature spike detected"),
                    subtitle: const Text("Shipment #UAE-221"),
                  ),
                ),

                SizedBox(height: 20.h),

                /// 🔹 ACTIVITY
                Text("Recent Activity",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),

                const ActivityItem(text: "AWB uploaded"),
                const ActivityItem(text: "Shipment departed"),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Welcome, Owner",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.notifications),
      ],
    );
  }

  Widget _buildKPIGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      children: const [
        KPIBox(title: "Active", value: "12"),
        KPIBox(title: "In Transit", value: "5"),
        KPIBox(title: "Delivered", value: "20"),
        KPIBox(title: "Alerts", value: "2"),
      ],
    );
  }

  Widget _buildShipmentList(WidgetRef ref) {
    final db = ref.watch(dbProvider);

    return FutureBuilder(
      future: db.getAllShipments(),
      builder: (context, snapshot) {

        /// 🔄 LOADING
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        /// ❌ ERROR
        if (snapshot.hasError) {
          return const Text("Error loading shipments");
        }

        final shipments = snapshot.data ?? [];

        /// 📭 EMPTY STATE (THIS IS WHAT YOU WANT)
        if (shipments.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Text(
                "No shipments yet",
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          );
        }

        /// ✅ DATA
        return Column(
          children: shipments.map((s) {
            return Card(
              child: ListTile(
                title: Text(s.id),
                subtitle: Text("${s.origin} → ${s.destination}"),
                trailing: Text("${s.temperature}°C"),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildAlerts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Alerts", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Card(
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: Text("Temperature spike detected", style: TextStyle(fontSize: 12.sp)),
            subtitle: Text("Shipment #UAE-221", style: TextStyle(fontSize: 11.sp)),
          ),
        ),
      ],
    );
  }

  Widget _buildActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Activity", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        ActivityItem(text: "AWB uploaded"),
        ActivityItem(text: "Shipment departed"),
        ActivityItem(text: "Batch processed"),
      ],
    );
  }
}

class KPIBox extends StatelessWidget {
  final String title;
  final String value;

  const KPIBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            Text(title, style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String text;

  const ActivityItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8),
          SizedBox(width: 8.w),
          Text(text, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }
}