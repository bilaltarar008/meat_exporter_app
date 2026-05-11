import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'archived_shipments_screen.dart';
import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';
import '../shipment/shipment_detail_screen.dart';
import '../../core/services/firestore_provider.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {

  String searchQuery = '';

  String selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            "Shipment Control Tower",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3,
            tabs: [
              Tab(text: "All"),
              Tab(text: "Slaughter"),
              Tab(text: "Warehouse"),
              Tab(text: "Done"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () => _showCreateDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.archive),

              onPressed: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                    const ArchivedShipmentsScreen(),
                  ),
                );
              },
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

              Padding(
                padding: const EdgeInsets.only(bottom: 16),

                child: TextField(
                  decoration: InputDecoration(
                 hintText: 'Search shipments...',
                 prefixIcon: const Icon(Icons.search),
                 filled: true,
                 fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),

          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
            });
          },
        ),
      ),

              SizedBox(
                height: 42,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [

                    _filterChip('all', 'All'),
                    _filterChip('pending', 'Pending'),
                    _filterChip('completed', 'Completed'),
                    _filterChip('profit', 'High Profit'),

                  ],
                ),
              ),

              SizedBox(height: 16.h),

              /// KPI
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

              SizedBox(height: 16.h),

              _needsAttention(),

              /// TAB CONTENT
              Expanded(
                child: TabBarView(
                  children: [
                    _buildList(db.watchAllShipments()),
                    _buildList(db.watchSlaughterShipments()),
                    _buildList(db.watchWarehouseShipments()),
                    _buildList(db.watchCompletedShipments()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= LIST =================

  Widget _buildList(Stream<List<Shipment>> stream) {
    return StreamBuilder<List<Shipment>>(
      stream: stream,
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final allShipments = snapshot.data!;

        final shipments = allShipments.where((s) {

          final code =
          (s.shipmentCode ?? '').toLowerCase();

          final title =
          s.title.toLowerCase();

          final matchesSearch =
              code.contains(searchQuery) ||
                  title.contains(searchQuery);

          bool matchesFilter = true;

          if (selectedFilter == 'pending') {

            matchesFilter =
                s.status.toLowerCase().contains('pending');

          } else if (selectedFilter == 'completed') {

            matchesFilter =
                s.currentStage == 'completed';

          } else if (selectedFilter == 'profit') {

            final profit =
                s.salePrice - s.purchaseCost;

            matchesFilter = profit > 1000;
          }

          return matchesSearch && matchesFilter;

        }).toList();

        if (shipments.isEmpty) {
          return const Center(child: Text("No shipments"));
        }

        return ListView.builder(
          itemCount: shipments.length,
          itemBuilder: (_, i) => _shipmentCard(shipments[i]),
        );
      },
    );
  }

  /// ================= CARD =================

  Widget _shipmentCard(Shipment s) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShipmentDetailScreen(shipment: s),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 TITLE + STATUS + MENU
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// SHIPMENT CODE
                        Text(
                          s.shipmentCode ?? "Shipment",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 4),

                        /// SHIPMENT TITLE
                        Text(
                          s.title,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _statusChip(s.status),

                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Color(0xFF6B7280),
                    ),

                    onSelected: (value) async {

                      if (value == 'archive') {

                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),

                              title: const Text(
                                "Archive Shipment",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              content: Text(
                                "This shipment will be removed from active operations but will remain available in archived history.",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),

                              actions: [

                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text("Cancel"),
                                ),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },

                                  child: const Text(
                                    "Archive",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                        if (confirm == true) {
                          await db.archiveShipment(s.id);

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                content: const Text(
                                  "Shipment archived successfully",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        }
                      }
                    },

                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: 'archive',
                        child: Row(
                          children: [
                            Icon(Icons.archive_outlined),
                            SizedBox(width: 10),
                            Text("Archive Shipment"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              /// 🔹 NEXT ACTION
              Text(
                "Next: ${s.nextAction}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 10.h),

              /// 🔹 TRACKER
              _tracker(s.currentStage),

              SizedBox(height: 12.h),

              /// 🔹 METRICS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _metric("Weight", "${s.weight} kg"),
                  _metric("Sale", "\$${s.salePrice}"),
                  _metric("Cost", "\$${s.purchaseCost}"),
                  _profit(s),
                ],
              ),

              SizedBox(height: 14.h),

              /// 🔹 ACTION BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: s.currentStage == 'completed'
                      ? null
                      : () async {
                    if (s.currentStage == 'owner') {
                      await db.updateStatus(
                        s.id,
                        "Animals Sent to Slaughter",
                        "Confirm slaughter completion",
                      );
                      await db.moveToSlaughter(s.id);

                    } else if (s.currentStage == 'slaughter') {
                      await db.updateStatus(
                        s.id,
                        "Processing Completed",
                        "Move to warehouse",
                      );
                      await db.completeSlaughter(s.id);

                    } else if (s.currentStage == 'warehouse') {
                      await db.updateStatus(
                        s.id,
                        "Shipment Completed",
                        "Await payment",
                      );
                      await db.completeWarehouse(s.id);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor(s.currentStage),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _buttonText(s.currentStage),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= HELPERS =================

  String _buttonText(String stage) {
    switch (stage) {
      case 'owner':
        return "Send for Processing";
      case 'slaughter':
        return "Transfer to Warehouse";
      case 'warehouse':
        return "Complete Shipment";
      default:
        return "Completed";
    }
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

  Widget _tracker(String stage) {
    int step = stage == 'owner'
        ? 1
        : stage == 'slaughter'
        ? 2
        : stage == 'warehouse'
        ? 3
        : 4;

    return Row(
      children: [
        _circle(step >= 1, "Owner"),
        _divider(step >= 2),
        _circle(step >= 2, "Slaughter"),
        _divider(step >= 3),
        _circle(step >= 3, "Warehouse"),
      ],
    );
  }

  Widget _circle(bool active, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: active ? Colors.blue : Colors.grey.shade300,
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: active ? Colors.blue : Colors.grey)),
      ],
    );
  }

  Widget _timelineStep(String title, bool done) {
    return Row(
      children: [
        Icon(
          done ? Icons.check_circle : Icons.radio_button_unchecked,
          color: done ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(title),
      ],
    );
  }

  Widget _filterChip(
      String value,
      String label,
      ) {

    final selected =
        selectedFilter == value;

    return Padding(
      padding: const EdgeInsets.only(right: 10),

      child: GestureDetector(

        onTap: () {

          setState(() {
            selectedFilter = value;
          });
        },

        child: Container(

          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),

          decoration: BoxDecoration(

            color: selected
                ? Colors.blue
                : Colors.white,

            borderRadius:
            BorderRadius.circular(30),

            border: Border.all(
              color: Colors.blue.shade100,
            ),
          ),

          child: Text(

            label,

            style: TextStyle(
              fontWeight: FontWeight.w600,

              color: selected
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }


  Widget _divider(bool active) {
    return Expanded(
      child: Container(
        height: 2,
        color: active ? Colors.blue : Colors.grey.shade300,
      ),
    );
  }

  Widget _metric(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF111827),)),
      ],
    );
  }

  Widget _profit(Shipment s) {
    final profit = s.salePrice - s.purchaseCost;

    return Column(
      children: [
        const Text("Profit", style: TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          "\$${profit.toStringAsFixed(0)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: profit >= 0 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _statusChip(String status) {
    Color bg;
    Color text;

    if (status.toLowerCase().contains("completed")) {
      bg = Colors.green.withOpacity(0.1);
      text = Colors.green;
    } else if (status.toLowerCase().contains("slaughter")) {
      bg = Colors.orange.withOpacity(0.1);
      text = Colors.orange;
    } else if (status.toLowerCase().contains("pending")) {
      bg = Colors.red.withOpacity(0.1);
      text = Colors.red;
    } else {
      bg = Colors.blue.withOpacity(0.1);
      text = Colors.blue;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 10,
          color: text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

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
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(fontSize: 11)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _needsAttention() {
    return StreamBuilder<List<Shipment>>(
      stream: db.watchAllShipments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final shipments = snapshot.data!;
        final alerts = <String>[];

        for (var s in shipments) {

          if (s.paymentStatus.toLowerCase() == 'pending') {
            if (s.paymentDue == null) {
              alerts.add(
                "${s.shipmentCode ?? s.title}: Payment not scheduled",
              );
            }
          }

          if (s.currentStage == 'owner') {
            alerts.add(
              "${s.shipmentCode ?? s.title}: Awaiting processing",
            );
          }
        }

        if (alerts.isEmpty) return const SizedBox();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.orange.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.warning_amber_rounded, color: Colors.orange),
                  SizedBox(width: 6),
                  Text(
                    "Needs Attention",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              ...alerts.map((e) => Text(
                "• $e",
                style: const TextStyle(fontSize: 12),
              )),
            ],
          ),
        );
      },
    );
  }

  /// ================= CREATE =================

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
          content: SingleChildScrollView(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: title, decoration: const InputDecoration(labelText: "Title")),
              TextField(controller: cost, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Cost")),
              TextField(controller: sale, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Sale")),
              TextField(controller: weight, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Weight")),
            ],
          ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              onPressed: () async {

                /// CLOSE KEYBOARD
                FocusScope.of(context).unfocus();

                /// VALIDATION
                if (title.text.trim().isEmpty) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Shipment title required"),
                    ),
                  );

                  return;
                }

                /// CREATE
                await db.createShipmentFull(
                  title: title.text.trim(),

                  cost:
                  double.tryParse(cost.text) ?? 0,

                  sale:
                  double.tryParse(sale.text) ?? 0,

                  weight:
                  double.tryParse(weight.text) ?? 0,
                );

                final shipmentCode =
                await db.generateShipmentCode();

                await firestoreService.createShipment(

                  shipmentCode: shipmentCode,

                  title: title.text.trim(),

                  cost:
                  double.tryParse(cost.text) ?? 0,

                  sale:
                  double.tryParse(sale.text) ?? 0,

                  weight:
                  double.tryParse(weight.text) ?? 0,
                );

                /// CLOSE DIALOG
                if (context.mounted) {
                  Navigator.of(context).pop();
                }

                /// SUCCESS
                if (context.mounted) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      content: const Text(
                        "Shipment created successfully",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
              },

              child: const Text(
                "Create Shipment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}