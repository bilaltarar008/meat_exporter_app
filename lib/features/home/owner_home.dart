import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {

  @override
  void initState() {
    super.initState();

    /// ✅ Run once
    db.fixStages();
  }

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

            /// KPI CARDS
            Row(
              children: [
                Expanded(child: _kpi("Total", db.countAll())),
                SizedBox(width: 6.w),
                Expanded(child: _kpi("Slaughter", db.countSlaughter())),
                SizedBox(width: 6.w),
                Expanded(child: _kpi("Warehouse", db.countWarehouse())),
                SizedBox(width: 6.w),
                Expanded(child: _kpi("Done", db.countCompleted())),
              ],
            ),

            SizedBox(height: 20.h),

            /// SHIPMENT LIST
            Expanded(
              child: StreamBuilder<List<Shipment>>(
                stream: db.watchOwnerShipments(),
                builder: (context, snapshot) {

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final shipments = snapshot.data!;

                  if (shipments.isEmpty) {
                    return const Center(
                      child: Text("No shipments yet"),
                    );
                  }

                  return ListView.builder(
                    itemCount: shipments.length,
                    itemBuilder: (_, i) {
                      final s = shipments[i];

                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        elevation: 3,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// 🔹 HEADER
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      s.title,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  _statusChip(s.status),
                                ],
                              ),

                              SizedBox(height: 10.h),

                              /// 🔹 TRACKER
                              _tracker(s.currentStage),

                              SizedBox(height: 14.h),

                              /// 🔹 DETAILS
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _info("Weight", "${s.weight} kg"),
                                  _info("Sale", "\$${s.salePrice}"),
                                ],
                              ),

                              SizedBox(height: 16.h),

                              /// 🔹 ACTION BUTTON
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    switch (s.currentStage) {
                                      case 'owner':
                                        await db.moveToSlaughter(s.id);
                                        break;

                                      case 'slaughter':
                                        await db.completeSlaughter(s.id);
                                        break;

                                      case 'warehouse':
                                        await db.completeWarehouse(s.id);
                                        break;
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _buttonColor(s.currentStage),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(vertical: 14.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    _buttonText(s.currentStage),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  /// BUTTON TEXT
  String _buttonText(String stage) {
    switch (stage) {
      case 'owner':
        return "Send to Slaughter";
      case 'slaughter':
        return "Move to Warehouse";
      case 'warehouse':
        return "Mark Completed";
      default:
        return "Done";
    }
  }

  /// TRACKER UI
  Widget _tracker(String stage) {
    Color getColor(String s) {
      if (stage == s) return Colors.blue;

      if (
      (stage == 'slaughter' && s == 'owner') ||
          (stage == 'warehouse' && (s == 'owner' || s == 'slaughter')) ||
          (stage == 'completed')
      ) {
        return Colors.green;
      }

      return Colors.grey;
    }

    return Row(
      children: [
        _step("Owner", getColor('owner')),
        _line(),
        _step("Slaughter", getColor('slaughter')),
        _line(),
        _step("Warehouse", getColor('warehouse')),
      ],
    );
  }

  Widget _step(String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: color,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _statusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _line() {
    return Expanded(
      child: Container(
        height: 1,
        color: Colors.grey.shade300,
      ),
    );
  }

  Color _buttonColor(String stage) {
    switch (stage) {
      case 'owner':
        return Colors.orange;
      case 'slaughter':
        return Colors.blue;
      case 'warehouse':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  /// KPI CARD
  Widget _kpi(String title, Stream<int> stream) {
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        final value = snapshot.data ?? 0;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// CREATE SHIPMENT DIALOG
  void _showCreateDialog(BuildContext context) {
    final title = TextEditingController();
    final cost = TextEditingController();
    final sale = TextEditingController();
    final weight = TextEditingController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Create Shipment"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: cost,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Cost"),
              ),
              TextField(
                controller: sale,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Sale"),
              ),
              TextField(
                controller: weight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Weight"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                await db.createShipmentFull(
                  title: title.text,
                  cost: double.tryParse(cost.text) ?? 0,
                  sale: double.tryParse(sale.text) ?? 0,
                  weight: double.tryParse(weight.text) ?? 0,
                );

                Navigator.pop(context);
              },
              child: const Text(
                "Create",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}