import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class SlaughterhouseHomeScreen extends StatelessWidget {
  const SlaughterhouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Slaughter Operations",
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
        stream: db.watchSlaughterShipments(),
        builder: (context, snapshot) {
          final shipments = snapshot.data ?? [];

          if (shipments.isEmpty) {
            return const Center(
              child: Text(
                "No slaughter tasks",
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
                        s.status,
                        style: const TextStyle(color: Colors.grey),
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              onPressed: () {
                                db.completeSlaughter(s.id);
                              },
                              child: const Text(
                                "Mark Slaughter Done",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
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