import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WarehouseHomeScreen extends StatelessWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warehouse"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('shipments')
              .where('slaughterDone', isEqualTo: true)
              .where('warehouseDone', isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data!.docs;

            if (docs.isEmpty) {
              return const Center(child: Text("No shipments for warehouse"));
            }

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final d = docs[i];

                return Card(
                  child: ListTile(
                    title: Text(d['title']),
                    subtitle: Text("Ready for warehouse"),

                    trailing: ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('shipments')
                            .doc(d.id)
                            .update({
                          'warehouseDone': true,
                          'status': 'Completed',
                        });
                      },
                      child: const Text("Receive"),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}