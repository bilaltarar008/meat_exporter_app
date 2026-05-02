import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class WarehouseHomeScreen extends StatelessWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FDF4),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Warehouse",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body: StreamBuilder<List<Shipment>>(
        stream: db.watchWarehouseShipments(),
        builder: (context, snapshot) {
          final shipments = snapshot.data ?? [];

          if (shipments.isEmpty) {
            return const Center(
              child: Text(
                "No warehouse shipments",
                style: TextStyle(color: Colors.black54),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: shipments.length,
            itemBuilder: (_, i) {
              final s = shipments[i];

              return Card(
                elevation: 4,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        s.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Text(
                        "Ready for receiving",
                        style: const TextStyle(color: Colors.grey),
                      ),

                      SizedBox(height: 10.h),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          db.completeWarehouse(s.id);
                        },
                        child: const Text(
                          "Mark Received",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}