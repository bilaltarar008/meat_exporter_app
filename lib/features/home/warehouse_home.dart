import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shipment/shipment_detail_screen.dart';
import '../shipment/warehouse_processing_screen.dart';

class WarehouseHomeScreen extends StatelessWidget {

  const WarehouseHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFFF5F7FB),

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        title: const Text(

          "Warehouse Operations",

          style: TextStyle(

            color: Color(0xFF0F172A),

            fontWeight: FontWeight.bold,

            fontSize: 20,
          ),
        ),

        actions: [

          IconButton(

            onPressed: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(

                  content: Text(
                    "Notifications coming soon",
                  ),
                ),
              );
            },

            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF0F172A),
            ),
          ),

          IconButton(

            onPressed: () async {

              final shouldLogout =
              await showDialog<bool>(

                context: context,

                builder: (dialogContext) {

                  return AlertDialog(

                    title: const Text(
                      "Logout",
                    ),

                    content: const Text(
                      "Are you sure you want to logout?",
                    ),

                    actions: [

                      TextButton(

                        onPressed: () {

                          Navigator.pop(
                            dialogContext,
                            false,
                          );
                        },

                        child: const Text(
                          "Cancel",
                        ),
                      ),

                      ElevatedButton(

                        onPressed: () {

                          Navigator.pop(
                            dialogContext,
                            true,
                          );
                        },

                        child: const Text(
                          "Logout",
                        ),
                      ),
                    ],
                  );
                },
              );

              if (shouldLogout == true) {

                await FirebaseAuth.instance.signOut();
              }
            },

            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
          ),
        ],

      ),

      body: StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance
            .collection('shipments')
            .snapshots(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final allDocs =
              snapshot.data!.docs;

          /// =========================
          /// INCOMING
          /// =========================

          final incomingDocs =
          allDocs.where((doc) {

            final shipment =
            doc.data()
            as Map<String, dynamic>;

            return shipment['currentStage']
                == 'slaughterhouse';

          }).toList();

          /// =========================
          /// IN WAREHOUSE
          /// =========================

          final warehouseDocs =
          allDocs.where((doc) {

            final shipment =
            doc.data()
            as Map<String, dynamic>;

            return shipment['currentStage']
                == 'warehouse';

          }).toList();

          /// =========================
          /// COMPLETED
          /// =========================

          final completedDocs =
          allDocs.where((doc) {

            final shipment =
            doc.data()
            as Map<String, dynamic>;

            return shipment['currentStage']
                == 'transit';

          }).toList();

          /// =========================
          /// TOTAL KG
          /// =========================

          double totalKg = 0;

          for (final doc in warehouseDocs) {

            final shipment =
            doc.data()
            as Map<String, dynamic>;

            totalKg +=
                (shipment['carcassWeight'] ?? 0)
                    .toDouble();
          }

          return SingleChildScrollView(

            padding:
            const EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                /// =========================
                /// DASHBOARD
                /// =========================

                SizedBox(

                  height: 110,

                  child: Row(

                    children: [

                      Expanded(

                        child: _miniDashboardCard(

                          title: "Incoming",

                          value:
                          incomingDocs.length.toString(),

                          color: Colors.orange,

                          icon:
                          Icons.inventory_2_outlined,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(

                        child: _miniDashboardCard(

                          title: "Warehouse",

                          value:
                          warehouseDocs.length.toString(),

                          color: Colors.green,

                          icon:
                          Icons.warehouse_outlined,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(

                        child: _miniDashboardCard(

                          title: "Sent",

                          value:
                          completedDocs.length.toString(),

                          color: Colors.blue,

                          icon:
                          Icons.local_shipping_outlined,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(

                        child: _miniDashboardCard(

                          title: "KG",

                          value:
                          totalKg.toStringAsFixed(0),

                          color: Colors.purple,

                          icon:
                          Icons.scale_rounded,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                const Text(

                  "Warehouse Queue",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                /// =========================
                /// SHIPMENTS
                /// =========================

                ...warehouseDocs.map((doc) {

                  final shipment =
                  doc.data()
                  as Map<String, dynamic>;

                  final meatItems =
                      shipment['meatItems'] ?? [];

                  double totalMeatWeight = 0;

                  for (final item in meatItems) {

                    totalMeatWeight +=
                        (item['weight'] ?? 0)
                            .toDouble();
                  }

                  return GestureDetector(

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              ShipmentDetailScreen(
                                shipmentId: doc.id,
                              )
                        ),
                      );
                    },

                    child: Container(

                      margin:
                      const EdgeInsets.only(
                        bottom: 18,
                      ),

                      padding:
                      const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(
                          24,
                        ),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.black
                                .withValues(
                              alpha: 0.04,
                            ),

                            blurRadius: 12,

                            offset:
                            const Offset(0, 6),
                          ),
                        ],
                      ),

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          /// HEADER

                          Row(

                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                            children: [

                              Text(

                                shipment['shipmentCode']
                                    ?? '',

                                style:
                                const TextStyle(

                                  fontSize: 22,

                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              Container(

                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 7,
                                ),

                                decoration:
                                BoxDecoration(

                                  color:
                                  Colors.green
                                      .withValues(
                                    alpha: 0.10,
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(
                                    30,
                                  ),
                                ),

                                child: const Text(

                                  "ACTIVE",

                                  style: TextStyle(

                                    color:
                                    Colors.green,

                                    fontWeight:
                                    FontWeight.bold,

                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          /// ROUTE

                          Text(

                            "${shipment['originCountry'] ?? 'N/A'} → ${shipment['destinationCountry'] ?? 'N/A'}",

                            style: TextStyle(

                              fontSize: 15,

                              color:
                              Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// MEAT BREAKDOWN

                          const Text(

                            "Meat Breakdown",

                            style: TextStyle(

                              fontWeight:
                              FontWeight.bold,

                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 14),

                          ...List.generate(
                            meatItems.length,
                                (index) {

                              final item =
                              meatItems[index];

                              return Container(

                                margin:
                                const EdgeInsets.only(
                                  bottom: 10,
                                ),

                                padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 12,
                                ),

                                decoration:
                                BoxDecoration(

                                  color:
                                  const Color(
                                      0xFFF8FAFC),

                                  borderRadius:
                                  BorderRadius.circular(
                                    14,
                                  ),
                                ),

                                child: Row(

                                  children: [

                                    Expanded(

                                      child: Text(

                                        item['name']
                                            ?? '',

                                        style:
                                        const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),

                                    Text(

                                      "${item['weight']} KG",

                                      style:
                                      const TextStyle(

                                        fontWeight:
                                        FontWeight.bold,

                                        color:
                                        Colors.green,

                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 14),

                          /// TOTAL MEAT

                          Container(

                            padding:
                            const EdgeInsets.all(14),

                            decoration: BoxDecoration(

                              color: Colors.green
                                  .withValues(
                                alpha: 0.08,
                              ),

                              borderRadius:
                              BorderRadius.circular(
                                16,
                              ),
                            ),

                            child: Row(

                              children: [

                                const Expanded(

                                  child: Text(

                                    "Total Meat Weight",

                                    style: TextStyle(

                                      fontWeight:
                                      FontWeight.bold,

                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                Text(

                                  "${totalMeatWeight.toStringAsFixed(0)} KG",

                                  style:
                                  const TextStyle(

                                    color:
                                    Colors.green,

                                    fontWeight:
                                    FontWeight.bold,

                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          /// BUTTON

                          SizedBox(

                            width: double.infinity,

                            child: ElevatedButton.icon(

                              onPressed: () {

                                Navigator.push(

                                  context,

                                  MaterialPageRoute(

                                    builder: (_) =>
                                        WarehouseProcessingScreen(
                                          shipmentId:
                                          doc.id,
                                        ),
                                  ),
                                );
                              },

                              icon: const Icon(
                                Icons.check_circle,
                              ),

                              label: const Text(
                                "Process Shipment",
                              ),

                              style:
                              ElevatedButton.styleFrom(

                                backgroundColor:
                                const Color(
                                    0xFF16A34A),

                                foregroundColor:
                                Colors.white,

                                padding:
                                const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),

                                shape:
                                RoundedRectangleBorder(

                                  borderRadius:
                                  BorderRadius.circular(
                                    16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _miniDashboardCard({

    required String title,

    required String value,

    required Color color,

    required IconData icon,
  }) {

    return Container(

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withValues(
              alpha: 0.03,
            ),

            blurRadius: 10,

            offset:
            const Offset(0, 4),
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            color: color,
            size: 18,
          ),

          const Spacer(),

          Text(

            value,

            style: const TextStyle(

              fontSize: 18,

              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Text(

            title,

            style: TextStyle(

              fontSize: 11,

              color:
              Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardCard({

    required String title,

    required String value,

    required Color color,

    required IconData icon,
  }) {

    return Container(

      padding:
      const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(22),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withValues(
              alpha: 0.04,
            ),

            blurRadius: 12,

            offset:
            const Offset(0, 5),
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: color,
            size: 24,
          ),

          const SizedBox(height: 14),

          Text(

            value,

            style: const TextStyle(

              fontSize: 24,

              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(

            title,

            style: TextStyle(

              color: Colors.grey.shade600,

              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}