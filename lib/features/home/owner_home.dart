import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/database_provider.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // 👈 FIXED BACKGROUND

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Local Control Tower",
          style: TextStyle(color: Colors.black),
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
              children: const [
                Expanded(child: _Kpi(title: "Local", value: "DB")),
                SizedBox(width: 8),
                Expanded(child: _Kpi(title: "Mode", value: "Offline")),
                SizedBox(width: 8),
                Expanded(child: _Kpi(title: "Status", value: "Active")),
              ],
            ),

            SizedBox(height: 16.h),

            /// LOCAL DB
            Expanded(
              child: StreamBuilder(
                stream: db.watchShipments(),
                builder: (context, snapshot) {

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final shipments = snapshot.data!;

                  if (shipments.isEmpty) {
                    return const Center(
                      child: Text(
                        "No local shipments",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: shipments.length,
                    itemBuilder: (_, i) {
                      final s = shipments[i];

                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: ListTile(
                          title: Text(
                            s.title,
                            style: const TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            s.status,
                            style: const TextStyle(color: Colors.grey),
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  final controller = TextEditingController(text: s.title);

                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("Edit Shipment"),
                                      content: TextField(
                                        controller: controller,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            await db.updateShipmentTitle(
                                                s.id, controller.text.trim());
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Update",  style: TextStyle(color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),

                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  db.deleteShipment(s.id);
                                },
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

  void _showCreateDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Create Shipment",
          style: TextStyle(color: Colors.black),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            hintText: "Enter title",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              await db.createShipment(controller.text.trim());
              Navigator.pop(context);
            },
            child: const Text("Create", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class _Kpi extends StatelessWidget {
  final String title;
  final String value;

  const _Kpi({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}