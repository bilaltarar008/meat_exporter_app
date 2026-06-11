import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../shipment/create_shipment_screen.dart';
import 'archived_shipments_screen.dart';
import '../../core/database/database_provider.dart';
import '../../core/services/shipment_attention_service.dart';
import '../../core/database/app_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    return Scaffold(

      backgroundColor: const Color(0xFFF3F4F6),

      /// ================= DRAWER =================

      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [

              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 36,
                backgroundColor: Color(0xFF2563EB),
                child: Icon(
                  Icons.inventory_2_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Shipment Dashboard",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),

              _drawerTile(
                icon: Icons.dashboard_rounded,
                title: 'All Shipments',
                onTap: () {

                  setState(() {
                    selectedFilter = 'all';
                  });

                  Navigator.pop(context);
                },
              ),

              _drawerTile(
                icon: Icons.local_shipping_rounded,
                title: 'Slaughter',
                onTap: () {
                  setState(() {
                    selectedFilter = 'slaughter';
                  });
                  Navigator.pop(context);
                },
              ),

              _drawerTile(
                icon: Icons.warehouse_rounded,
                title: 'Warehouse',
                onTap: () {
                  setState(() {
                    selectedFilter = 'warehouse';
                  });
                  Navigator.pop(context);
                },
              ),

              _drawerTile(
                icon: Icons.check_circle_outline,
                title: 'Completed',
                onTap: () {
                  setState(() {
                    selectedFilter = 'completed';
                  });
                  Navigator.pop(context);
                },
              ),

              _drawerTile(
                icon: Icons.archive_outlined,
                title: 'Archived Shipments',
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                      const ArchivedShipmentsScreen(),
                    ),
                  );
                },
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },

                    icon: const Icon(Icons.logout),

                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// ================= APPBAR =================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,

        title: const Text(
          "Shipment Control Tower",
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),

        actions: [

          /// CREATE
          Padding(
            padding: const EdgeInsets.only(right: 8),

            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(14),

                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withValues(alpha:0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: IconButton(

                padding: const EdgeInsets.all(12),

                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 15,
                ),

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const CreateShipmentScreen(),
                    ),
                  );
                },
              ),
            ),
          ),



          /// MENU
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Color(0xFF111827),
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),

          const SizedBox(width: 6),
        ],
      ),

      /// ================= BODY =================

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            /// SEARCH BAR

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search shipments...',
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),

                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),

            const SizedBox(height: 4),

            /// FILTERS

            SizedBox(
              height: 46,

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

            const SizedBox(height: 4),

            /// KPI SECTION

            StreamBuilder<List<Map<String, dynamic>>>(

              stream: firestoreService.watchShipments(),

              builder: (context, snapshot) {

                final data = snapshot.data ?? [];

                final total =
                    data.length;

                final slaughter =
                    data.where(
                          (e) =>
                      e['currentStage'] == 'slaughter',
                    ).length;

                final warehouse =
                    data.where(
                          (e) =>
                      e['currentStage'] == 'warehouse',
                    ).length;

                final completed =
                    data.where(
                          (e) =>
                      e['currentStage'] == 'completed',
                    ).length;

                return Row(

                  children: [

                    Expanded(
                      child: _kpiStatic(
                        "Total",
                        total,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: _kpiStatic(
                        "Slaughter",
                        slaughter,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: _kpiStatic(
                        "Warehouse",
                        warehouse,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: _kpiStatic(
                        "Done",
                        completed,
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 10),

            /// SHIPMENT LIST

            Expanded(
              child: _buildFirestoreList(),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= SHIPMENT CARD =================

  Widget _shipmentCard(
      Shipment s,
      Map<String, dynamic> data,
      ) {

    return InkWell(

      borderRadius: BorderRadius.circular(18),

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) => ShipmentDetailScreen(
              shipmentId: s.firestoreId!,
            ),
          ),
        );
      },

      child: Card(

        margin: const EdgeInsets.only(bottom: 16),

        elevation: 0,

        color: Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// TOP ROW

              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          s.shipmentCode ?? "Shipment",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "${s.origin} → ${s.destination}",

                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
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
                    ),

                    onSelected: (value) async {

                      if (value == 'archive') {

                        final confirm =
                        await showDialog<bool>(

                          context: context,

                          builder: (_) {

                            return AlertDialog(

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(18),
                              ),

                              title: const Text(
                                "Archive Shipment",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              content: Text(
                                'Are you sure you want to archive "${s.title}" shipment?',
                              ),

                              actions: [

                                TextButton(

                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },

                                  child: const Text(
                                    "Cancel",
                                  ),
                                ),

                                ElevatedButton(

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                  ),

                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },

                                  child: const Text(
                                    "Archive",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                        if (confirm != true) return;

                        await firestoreService.archiveShipment(
                          s.firestoreId!,
                        );

                        if (mounted) {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(

                            const SnackBar(
                              content: Text(
                                "Shipment archived",
                              ),
                            ),
                          );
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

                            Text("Archive"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// NEXT ACTION

              Text(
                "Next: ${s.nextAction}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 4),

              /// ALERTS

              _buildShipmentAlerts(s),

              const SizedBox(height: 4),

              /// TRACKER

              _tracker(s.currentStage),

              const SizedBox(height: 12),

              /// METRICS

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  _metric(
                    "Weight (KG)",
                    "${s.weight} kg",
                  ),

                  _metric(
                    "Sale Price",
                    "\$${s.salePrice}",
                  ),

                  _metric(
                    "Amount Paid",
                    "\$${s.purchaseCost}",
                  ),

                  _profit(s),
                ],
              ),

              const SizedBox(height: 12),

              /// BUTTON

        SizedBox(
          width: double.infinity,

          child: ElevatedButton(

            onPressed:
            s.currentStage == 'completed'
                ? null
                : () async {

              if (s.currentStage ==
                  ShipmentStages.owner) {

                await firestoreService.sendToSlaughter(
                  docId: s.firestoreId!,
                );

              } else if (s.currentStage ==
                  ShipmentStages.slaughter) {

                await firestoreService.moveToWarehouse(
                  docId: s.firestoreId!,
                );

                await db.completeSlaughter(s.id);

              } else if (s.currentStage ==
                  ShipmentStages.warehouse) {

                await firestoreService.dispatchShipment(
                  docId: s.firestoreId!,
                );

                await db.completeWarehouse(s.id);

              } else if (s.currentStage ==
                  ShipmentStages.transit) {

                await firestoreService.markDelivered(
                  docId: s.firestoreId!,
                );

              } else if (s.currentStage ==
                  ShipmentStages.delivered) {

                await firestoreService.completeShipment(
                  docId: s.firestoreId!,
                );
              }
            },

            style: ElevatedButton.styleFrom(

              backgroundColor:
              _buttonColor(s.currentStage),

              padding:
              const EdgeInsets.symmetric(
                vertical: 14,
              ),

              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(14),
              ),
            ),

            child: Text(

              _buttonText(s.currentStage),

              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
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
              return "Send To Slaughter";

              case 'slaughter':
              return "Move To Warehouse";

              case 'warehouse':
              return "Dispatch Shipment";

              case 'transit':
              return "Mark Delivered";

              case 'delivered':
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
    return Colors.deepOrange;

    case 'warehouse':
    return Colors.blue;

    case 'transit':
    return Colors.indigo;

    case 'delivered':
    return Colors.green;

    default:
    return Colors.grey;
    }
    }

  Widget _tracker(String stage) {

    int step = 1;

    switch (stage) {

      case 'owner':
        step = 1;
        break;

      case 'slaughter':
        step = 2;
        break;

      case 'warehouse':
        step = 3;
        break;

      case 'transit':
        step = 4;
        break;

      case 'delivered':
        step = 5;
        break;

      case 'completed':
        step = 6;
        break;
    }

    return Row(

      children: [

        _circle(step >= 1, "Owner"),
        _divider(step >= 2),

        _circle(step >= 2, "Slaughter"),
        _divider(step >= 3),

        _circle(step >= 3, "Warehouse"),
        _divider(step >= 4),

        _circle(step >= 4, "Transit"),
        _divider(step >= 5),

        _circle(step >= 5, "Delivered"),
        _divider(step >= 6),

        _circle(step >= 6, "Done"),
      ],
    );
  }

  Widget _circle(bool active, String label) {

    return Column(
      children: [

        CircleAvatar(
          radius: 5,

          backgroundColor:
          active
              ? Colors.blue
              : Colors.grey.shade300,
        ),

        const SizedBox(height: 4),

        Text(
          label,

          style: TextStyle(
            fontSize: 10,

            color:
            active
                ? Colors.blue
                : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildFirestoreList() {

    return StreamBuilder<List<Map<String, dynamic>>>(

      stream: firestoreService.watchShipments(),

      builder: (context, snapshot) {

        if (snapshot.connectionState ==
            ConnectionState.waiting) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {

          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (!snapshot.hasData ||
            snapshot.data!.isEmpty) {

          return const Center(
            child: Text("No shipments found"),
          );
        }

        final firestoreShipments =
        snapshot.data!;

        final attentionService =
        ShipmentAttentionService();

        final alerts =
        attentionService.generateAlerts(
          firestoreShipments,
        );

        final shipments =
        firestoreShipments.map((data) {

          return Shipment(

            blocked:
            data['blocked'] ?? false,

            blockedReason:
            data['blockedReason'] ?? '',

            paymentDue:
            data['paymentDueDate'] != null
                ? (data['paymentDueDate'] as Timestamp).toDate()
                : null,

            paymentReceivedDate:
            data['paymentReceivedDate'] != null
                ? (data['paymentReceivedDate'] as Timestamp).toDate()
                : null,

            outstandingBalance:
            (data['outstandingBalance'] ?? 0)
                .toDouble(),

            totalPaid:
            (data['totalPaid'] ?? 0)
                .toDouble(),

            id: 0,

            title: data['title'] ?? '',

            shipmentCode:
            data['shipmentCode'],

            origin:
            data['originCountry'] ?? 'Pakistan',

            destination:
            data['destinationCountry'] ?? 'Dubai',

            slaughterhouse:
            data['slaughterhouse'],

            freightForwarder:
            data['freightForwarder'],

            airline:
            data['airline'],

            destinationWarehouse:
            data['destinationWarehouse'],

            supplier:
            data['supplier'],

            buyer:
            data['buyer'],

            animalType:
            data['animalType'],

            quantity:
            (data['quantity'] ?? 0).toDouble(),

            purchaseWeight:
            (data['purchaseWeight'] ?? 0).toDouble(),

            carcassWeight:
            (data['carcassWeight'] ?? 0).toDouble(),

            netSaleWeight:
            (data['netSaleWeight'] ?? 0).toDouble(),

            nextAction:
            data['nextAction'] ??
                'Continue Processing',

            paymentStatus:
            data['paymentStatus'] ?? 'pending',

            purchaseCost:
            (data['purchaseCost'] ?? 0).toDouble(),

            salePrice:
            (data['salePrice'] ?? 0).toDouble(),

            slaughterhouseCost:
            (data['slaughterhouseCost'] ?? 0).toDouble(),

            coldStorageCost:
            (data['coldStorageCost'] ?? 0).toDouble(),

            freightCost:
            (data['freightCost'] ?? 0).toDouble(),

            airportHandlingCost:
            (data['airportHandlingCost'] ?? 0).toDouble(),

            weight:
            (data['purchaseWeight'] ?? 0).toDouble(),

            awbNumber:
            data['awbNumber'],

            flightNumber:
            data['flightNumber'],

            departureDate: null,

            arrivalDate: null,

            notes:
            data['notes'],

            status:
            data['status'] ?? '',

            currentStage:
            data['currentStage'] ?? 'owner',

            slaughterDone: false,

            warehouseDone: false,

            firestoreId:
            data['id'],

            synced: true,

            updatedAt: DateTime.now(),

            archived:
            data['archived'] ?? false,
          );

        }).where((s) {

          final code =
          (s.shipmentCode ?? '')
              .toLowerCase();

          final title =
          s.title.toLowerCase();

          final matchesSearch =
              code.contains(searchQuery) ||
                  title.contains(searchQuery);

          bool matchesFilter = true;

          if (selectedFilter ==
              'slaughter') {

            matchesFilter =
                s.currentStage ==
                    'slaughter';

          } else if (selectedFilter ==
              'warehouse') {

            matchesFilter =
                s.currentStage ==
                    'warehouse';

          } else if (selectedFilter ==
              'completed') {

            matchesFilter =
                s.currentStage ==
                    'completed';

          } else if (selectedFilter ==
              'pending') {

            matchesFilter =
                s.currentStage ==
                    'owner';

          } else if (selectedFilter ==
              'profit') {

            final profit =
                s.salePrice - s.purchaseCost;

            matchesFilter = profit > 0;
          }

          return matchesSearch &&
              matchesFilter;

        }).toList();

        if (shipments.isEmpty) {

          return const Center(
            child: Text(
              "No shipments found",
            ),
          );
        }

        return Column(

          children: [

            if (alerts.isNotEmpty)

              Container(

                margin: const EdgeInsets.only(
                  bottom: 14,
                ),

                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(18),
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const Text(

                      "Needs Attention",

                      style: TextStyle(

                        fontWeight: FontWeight.bold,

                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 14),

                    ...alerts.take(5).map(

                          (alert) {

                        return Padding(

                          padding:
                          const EdgeInsets.only(
                            bottom: 12,
                          ),

                          child: Row(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Icon(

                                Icons.warning_amber_rounded,

                                color:
                                alert.severity == 'high'
                                    ? Colors.red
                                    : Colors.orange,
                              ),

                              const SizedBox(width: 10),

                              Expanded(

                                child: Column(

                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,

                                  children: [

                                    Text(

                                      alert.title,

                                      style: const TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 2),

                                    Text(
                                      alert.message,
                                    ),

                                    const SizedBox(height: 2),

                                    Text(

                                      alert.shipmentCode,

                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

            Expanded(

              child: ListView.builder(

                itemCount: shipments.length,

                itemBuilder: (_, i) {

                  return _shipmentCard(
                    shipments[i],
                    firestoreShipments[i],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _divider(bool active) {

    return Expanded(
      child: Container(
        height: 2,

        color:
        active
            ? Colors.blue
            : Colors.grey.shade300,
      ),
    );
  }

  Widget _metric(String label, String value) {

    return Column(
      children: [

        Text(
          label,

          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF9CA3AF),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }

  Widget _profit(Shipment s) {

    final profit =
        s.salePrice - s.purchaseCost;

    return Column(
      children: [

        const Text(
          "Profit",

          style: TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          "\$${profit.toStringAsFixed(0)}",

          style: TextStyle(
            fontWeight: FontWeight.bold,

            color:
            profit >= 0
                ? Colors.green
                : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _statusChip(String status) {

    Color bg;
    Color text;

    if (status.toLowerCase().contains("completed")) {

      bg = Colors.green.withValues(alpha: 0.1);
      text = Colors.green;

    } else if (status.toLowerCase()
        .contains("slaughter")) {

      bg = Colors.orange.withValues(alpha: 0.1);
      text = Colors.orange;

    } else if (status.toLowerCase()
        .contains("pending")) {

      bg = Colors.red.withValues(alpha: 0.1);
      text = Colors.red;

    } else {

      bg = Colors.blue.withValues(alpha: 0.1);
      text = Colors.blue;
    }

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),

      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
      ),

      child: Text(
        status,

        style: TextStyle(
          fontSize: 11,
          color: text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildShipmentAlerts(Shipment s) {

    final List<String> alerts = [];

    if (s.blocked == true) {

      alerts.add(
        "Shipment blocked: ${s.blockedReason}",
      );
    }

    if (s.paymentStatus.toLowerCase() ==
        'pending') {

      if (s.paymentDue == null) {

        alerts.add("Payment not scheduled");
      }
    }

    if (s.paymentDue != null &&
        s.paymentStatus != 'Completed') {

      final days =
          s.paymentDue!
              .difference(DateTime.now())
              .inDays;

      if (days < 0) {

        alerts.add(
          "Payment overdue",
        );

      } else if (days <= 3) {

        alerts.add(
          "Payment due soon",
        );
      }
    }

    if (s.currentStage == 'transit' &&
        (s.awbNumber == null ||
            s.awbNumber!.isEmpty)) {

      alerts.add(
        "AWB missing",
      );
    }

    if (s.currentStage == 'delivered') {

      alerts.add(
        "Warehouse receipt pending",
      );
    }

    if (s.currentStage == 'owner') {

      alerts.add(
        "Awaiting processing",
      );
    }

    if (alerts.isEmpty) {

      return const SizedBox();
    }

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),

        borderRadius:
        BorderRadius.circular(12),

        border: Border.all(
          color: Colors.orange.shade200,
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(
            children: const [

              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 18,
              ),

              SizedBox(width: 6),

              Text(
                "Needs Attention",

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 13,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          ...alerts.map(

                (alert) => Padding(

              padding: const EdgeInsets.only(
                bottom: 4,
              ),

              child: Row(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const Text("• "),

                  Expanded(
                    child: Text(
                      alert,

                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(
      String value,
      String label,
      ) {

    final selected =
        selectedFilter == value;

    return Padding(

      padding: const EdgeInsets.only(
        right: 10,
      ),

      child: GestureDetector(

        onTap: () {

          setState(() {
            selectedFilter = value;
          });
        },

        child: Container(

          padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),

          decoration: BoxDecoration(

            color:
            selected
                ? const Color(0xFF2563EB)
                : Colors.white,

            borderRadius:
            BorderRadius.circular(30),

            border: Border.all(
              color: const Color(0xFFBFDBFE),
            ),
          ),

          child: Text(
            label,

            style: TextStyle(
              fontWeight: FontWeight.w600,

              color:
              selected
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _kpiStatic(
      String title,
      int value,
      ) {

    return Container(

      height: 72,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(14),

        boxShadow: [

          BoxShadow(
            color:
            Colors.black.withValues(alpha:0.03),

            blurRadius: 6,

            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Text(

            value.toString(),

            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF111827),
            ),
          ),

          const SizedBox(height: 4),

          Text(

            title,

            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerTile({

    required IconData icon,

    required String title,

    required VoidCallback onTap,

  }) {

    return ListTile(

      leading: Icon(
        icon,
        color: const Color(0xFF374151),
      ),

      title: Text(
        title,

        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),

      onTap: onTap,
    );
  }
}