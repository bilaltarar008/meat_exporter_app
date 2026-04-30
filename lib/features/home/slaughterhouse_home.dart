import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SlaughterhouseHomeScreen extends StatelessWidget {
  const SlaughterhouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slaughter", style: TextStyle(color: Colors.black)),
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
              .where('slaughterDone', isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data!.docs;

            if (docs.isEmpty) {
              return const Center(child: Text("No pending slaughter", style: TextStyle(color: Colors.black),));
            }

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final d = docs[i];

                return Card(
                  child: ListTile(
                    title: Text(d['title']),
                    subtitle: Text("Status: ${d['status']}"),

                    trailing: ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('shipments')
                            .doc(d.id)
                            .update({
                          'slaughterDone': true,
                          'status': 'Slaughter Completed',
                        });
                      },
                      child: const Text("Mark Done", style: TextStyle(color: Colors.black)),
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