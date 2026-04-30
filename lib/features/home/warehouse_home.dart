import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/database_provider.dart';

class WarehouseHomeScreen extends StatelessWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Warehouse", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body: StreamBuilder(
        stream: db.watchWarehouseShipments(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final shipments = snapshot.data!;

          if (shipments.isEmpty) {
            return const Center(
              child: Text("No warehouse shipments", style: TextStyle(color: Colors.black)),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: shipments.length,
            itemBuilder: (_, i) {
              final s = shipments[i];

              return Card(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 12.h),
                child: ListTile(
                  title: Text(s.title, style: const TextStyle(color: Colors.black)),
                  subtitle: Text(s.status),

                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      db.completeWarehouse(s.id);
                    },
                    child: const Text("Receive", style: TextStyle(color: Colors.white)),
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