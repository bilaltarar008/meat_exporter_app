import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Shipment Control Tower",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () => _showCreateDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [

            /// KPI
            Row(
              children: [
                Expanded(child: _Kpi(title: "DB", value: "Local")),
                SizedBox(width: 8.w),
                Expanded(child: _Kpi(title: "Mode", value: "Offline")),
                SizedBox(width: 8.w),
                Expanded(child: _Kpi(title: "Status", value: "Active")),
              ],
            ),

            SizedBox(height: 20.h),

            /// LIST
            Expanded(
              child: StreamBuilder<List<Shipment>>(
                stream: db.watchOwnerShipments(),
                builder: (context, snapshot) {
                  final shipments = snapshot.data ?? [];

                  if (shipments.isEmpty) {
                    return const Center(
                      child: Text(
                        "No shipments yet",
                        style: TextStyle(color: Colors.black54),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: shipments.length,
                    itemBuilder: (_, i) {
                      final s = shipments[i];

                      return Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: EdgeInsets.only(bottom: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// TITLE
                              Text(
                                s.title,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 8.h),

                              /// 🔥 TRACKER
                              _tracker(s.currentStage),

                              SizedBox(height: 10.h),

                              /// STATUS
                              Text(
                                "Status: ${s.status}",
                                style: const TextStyle(color: Colors.grey),
                              ),

                              SizedBox(height: 10.h),

                              /// ACTIONS
                              Row(
                                children: [

                                  /// SEND TO SLAUGHTER
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      onPressed: () {
                                        db.moveToSlaughter(s.id);
                                      },
                                      child: const Text(
                                        "Send",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 8.w),

                                  /// DELETE
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        db.deleteShipment(s.id);
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tracker(String stage) {
    Color owner = Colors.grey;
    Color slaughter = Colors.grey;
    Color warehouse = Colors.grey;

    if (stage == 'owner') owner = Colors.blue;
    if (stage == 'slaughter') slaughter = Colors.orange;
    if (stage == 'warehouse') warehouse = Colors.green;

    return Row(
      children: [
        _step("Owner", owner),
        _line(),
        _step("Slaughter", slaughter),
        _line(),
        _step("Warehouse", warehouse),
      ],
    );
  }

  Widget _step(String label, Color color) {
    return Column(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: color)),
      ],
    );
  }

  Widget _line() {
    return Expanded(
      child: Container(height: 1, color: Colors.grey.shade300),
    );
  }

  /// CREATE
  void _showCreateDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Create Shipment", style: TextStyle(color: Colors.black),),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            hintText: "Enter shipment name",
            hintStyle: TextStyle(color: Colors.blueGrey),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () async {
              final text = controller.text.trim();
              if (text.isEmpty) return;

              await db.createShipment(text);

              Navigator.pop(context);
            },
            child: const Text(
              "Create",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _Kpi extends StatelessWidget {
  final String title;
  final String value;

  const _Kpi({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
