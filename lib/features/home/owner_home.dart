import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/shipment/shipment_service.dart';

class OwnerHomeScreen extends ConsumerWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// WEB BLOCK
    if (kIsWeb) {
      return const Scaffold(
        body: Center(
          child: Text("Database not supported on Web"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Owner Dashboard",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
        actions: [
          /// ➕ CREATE SHIPMENT
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateDialog(context),
          ),

          /// 🚪 LOGOUT
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
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

              /// KPI (still static for now)
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

              /// SHIPMENTS TITLE
              Text(
                "Shipments",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              /// SHIPMENTS LIST
              _buildShipmentList(),

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

  /// 🔹 CREATE SHIPMENT DIALOG
  void _showCreateDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Create Shipment"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Enter shipment title",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (controller.text.trim().isEmpty) return;

                await ShipmentService()
                    .createShipment(controller.text.trim());

                Navigator.pop(context);
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  /// 🔹 SHIPMENTS LIST (FIRESTORE)
  Widget _buildShipmentList() {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('shipments')
          .where('ownerId', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Column(
            children: const [
              Icon(Icons.inventory_2, size: 40, color: Colors.grey),
              SizedBox(height: 10),
              Text("No shipments yet"),
            ],
          );
        }

        final docs = snapshot.data!.docs;

        return Column(
          children: docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;

            final status = data['status'] ?? 'unknown';
            final slaughterDone = data['slaughterDone'] ?? false;
            final warehouseDone = data['warehouseDone'] ?? false;

            return Card(
              margin: EdgeInsets.symmetric(vertical: 6.h),
              child: ListTile(
                title: Text(
                  data['title'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Status: ${status.toUpperCase()}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      slaughterDone
                          ? Icons.check_circle
                          : Icons.pending,
                      color:
                      slaughterDone ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      warehouseDone
                          ? Icons.check_circle
                          : Icons.pending,
                      color:
                      warehouseDone ? Colors.green : Colors.orange,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  /// ALERTS (STATIC FOR NOW)
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

  /// ACTIVITY (STATIC)
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

/// KPI BOX
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