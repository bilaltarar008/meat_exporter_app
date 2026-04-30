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
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Slaughter", style: TextStyle(color: Colors.black)),
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
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: shipments.length,
            itemBuilder: (_, i) {
              final s = shipments[i];

              return Card(
                color: Colors.white,
                elevation: 2,
                margin: EdgeInsets.only(bottom: 12.h),
                child: ListTile(
                  title: Text(
                    s.title.isEmpty ? "Untitled Shipment" : s.title,
                    style: const TextStyle(color: Colors.black),
                  ),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.status,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Stage: Slaughter",
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ],
                  ),

                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        db.completeSlaughter(s.id);
                      },
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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