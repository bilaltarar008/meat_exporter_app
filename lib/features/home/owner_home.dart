import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import '../../core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/database/database_provider.dart';

class OwnerHomeScreen extends ConsumerWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// ✅ FIX 1: WEB BLOCK (VERY IMPORTANT)
    if (kIsWeb) {
      return const Scaffold(
        body: Center(
          child: Text("Database not supported on Web"),
        ),
      );
    }

    final db = ref.watch(dbProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Owner Dashboard",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.red, // Sets the icon color to red
            iconSize: 30.0,
            onPressed: () {
              FirebaseAuth.instance.signOut();
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

              /// HEADER
              Text(
                "Welcome, Owner",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              /// KPI GRID
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

              /// SHIPMENTS
              Text(
                "Shipments",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              _buildShipmentList(ref),

              SizedBox(height: 20.h),

              _buildAlerts(),

              SizedBox(height: 20.h),

              _buildActivity(),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 SHIPMENTS LIST
  Widget _buildShipmentList(WidgetRef ref) {
    final db = ref.watch(dbProvider);

    return FutureBuilder(
      future: db.getAllShipments(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final shipments = snapshot.data ?? [];

        if (shipments.isEmpty) {
          return const Center(child: Text("No shipments"));
        }

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

  /// ALERTS
  Widget _buildAlerts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alerts",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Card(
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: Text(
              "Temperature spike detected",
              style: TextStyle(fontSize: 12.sp),
            ),
            subtitle: Text(
              "Shipment #UAE-221",
              style: TextStyle(fontSize: 11.sp),
            ),
          ),
        ),
      ],
    );
  }

  /// ACTIVITY
  Widget _buildActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Activity",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        const ActivityItem(text: "AWB uploaded"),
        const ActivityItem(text: "Shipment departed"),
        const ActivityItem(text: "Batch processed"),
      ],
    );
  }
}

/// ✅ FIXED KPI BOX (PROFESSIONAL)
class KPIBox extends StatelessWidget {
  final String title;
  final String value;

  const KPIBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ACTIVITY ITEM
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