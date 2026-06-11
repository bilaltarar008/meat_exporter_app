import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShipmentDetailScreen extends StatelessWidget {

  final String shipmentId;

  const ShipmentDetailScreen({
    super.key,
    required this.shipmentId,
  });

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<DocumentSnapshot>(

      stream: FirebaseFirestore.instance
          .collection('shipments')
          .doc(shipmentId)
          .snapshots(),

      builder: (context, snapshot) {

        if (!snapshot.hasData) {

          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final shipment =
        snapshot.data!.data()
        as Map<String, dynamic>;

        final double purchaseCost =
        (shipment['purchaseCost'] ?? 0)
            .toDouble();

        final double weight =
        (shipment['carcassWeight'] ?? 0)
            .toDouble();

        final List meatItems =
            shipment['meatItems'] ?? [];

        final double slaughterhouseCost =
        (shipment['slaughterhouseCost'] ?? 0)
            .toDouble();

        final double coldStorageCost =
        (shipment['coldStorageCost'] ?? 0)
            .toDouble();

        final double freightCost =
        (shipment['freightCost'] ?? 0)
            .toDouble();

        final double airportHandlingCost =
        (shipment['airportHandlingCost'] ?? 0)
            .toDouble();

        final double totalOperationalCost =
            purchaseCost +
                slaughterhouseCost +
                coldStorageCost +
                freightCost +
                airportHandlingCost;

        return Scaffold(

          backgroundColor:
          const Color(0xFFF3F4F6),

          appBar: AppBar(

            elevation: 0,

            backgroundColor: Colors.white,

            foregroundColor: Colors.black,

            title: Text(
              shipment['shipmentCode']
                  ?? "Shipment",
            ),
          ),

          body: SingleChildScrollView(

            padding:
            const EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                /// HEADER

                Container(

                  width: double.infinity,

                  padding:
                  const EdgeInsets.all(20),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(24),
                  ),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Row(

                        children: [

                          Expanded(

                            child: Column(

                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                Text(

                                  shipment['shipmentCode']
                                      ?? "Shipment",

                                  style:
                                  const TextStyle(

                                    fontSize: 28,

                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(

                                  "${shipment['originCity'] ?? 'N/A'}, "
                                      "${shipment['originCountry'] ?? 'N/A'}"
                                      "  →  "
                                      "${shipment['destinationCity'] ?? 'N/A'}, "
                                      "${shipment['destinationCountry'] ?? 'N/A'}",

                                  style:
                                  const TextStyle(

                                    color: Colors.grey,

                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          _statusChip(
                            shipment['status'] ?? '',
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      _buildMeatSection(
                        meatItems,
                        weight,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(

                  "Shipment Timeline",

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                _buildFirestoreTimeline(
                  shipment,
                ),

                const SizedBox(height: 24),

                const Text(

                  "Operational Expenses",

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                _buildExpenseCard(
                  "Animal Purchase",
                  purchaseCost,
                  Icons.shopping_cart_outlined,
                  Colors.orange,
                ),

                _buildExpenseCard(
                  "Slaughterhouse",
                  slaughterhouseCost,
                  Icons.cut,
                  Colors.red,
                ),



                Container(

                  width: double.infinity,

                  padding:
                  const EdgeInsets.all(18),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(18),
                  ),

                  child: Row(

                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      const Text(

                        "Total Operational Cost",

                        style: TextStyle(

                          fontWeight:
                          FontWeight.bold,

                          fontSize: 16,
                        ),
                      ),

                      Text(

                        "\$${totalOperationalCost.toStringAsFixed(0)}",

                        style: const TextStyle(

                          fontWeight:
                          FontWeight.bold,

                          fontSize: 18,

                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                if ((shipment['notes'] ?? '')
                    .toString()
                    .isNotEmpty) ...[

                  const Text(

                    "Owner Notes",

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Container(

                    width: double.infinity,

                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(18),
                    ),

                    child: Text(

                      shipment['notes'],

                      style: const TextStyle(

                        fontSize: 15,

                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  /// =========================
  /// TIMELINE
  /// =========================

  Widget _buildFirestoreTimeline(
      Map<String, dynamic> shipment,
      ) {

    final timeline =
        shipment['timeline'] ?? [];

    if (timeline.isEmpty) {

      return Container(

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(18),
        ),

        child: const Text(
          "No timeline events yet",
        ),
      );
    }

    return Column(

      children: List.generate(

        timeline.length,

            (index) {

          final item =
          timeline[index];

          return _timelineItem(
            item['title'] ?? '',
            item['description'] ?? '',
            item['createdAt'],
          );
        },
      ),
    );
  }

  Widget _timelineItem(
      String title,
      String subtitle,
      dynamic createdAt,
      ) {

    String formattedDate = '';

    if (createdAt != null &&
        createdAt is Timestamp) {

      final date =
      createdAt.toDate();

      formattedDate =
      "${date.day}/${date.month}/${date.year} • "
          "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
    }

    return SizedBox(

      width: double.infinity,

      child: Container(

        margin:
        const EdgeInsets.only(
          bottom: 12,
        ),

        padding:
        const EdgeInsets.all(16),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(16),
        ),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Text(

              title,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ) ,

            const SizedBox(height: 6),

            Text(subtitle),

            const SizedBox(height: 8),

            Text(

              formattedDate,

              style: const TextStyle(

                color: Colors.grey,

                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// =========================
  /// EXPENSE CARD
  /// =========================

  Widget _buildExpenseCard(
      String title,
      double amount,
      IconData icon,
      Color color,
      ) {

    return Container(

      margin:
      const EdgeInsets.only(
        bottom: 12,
      ),

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Row(

        children: [

          Icon(
            icon,
            color: color,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(title),
          ),

          Text(
            "\$${amount.toStringAsFixed(0)}",
          ),
        ],
      ),
    );
  }

  /// =========================
  /// MEAT SECTION
  /// =========================

  Widget _buildMeatSection(
      List meatItems,
      double weight,
      ) {

    return Column(

      children: [

        _metricCard(
          "Total Weight",
          "${weight.toStringAsFixed(0)} kg",
          Icons.scale,
          Colors.green,
        ),

        const SizedBox(height: 16),

        if (meatItems.isNotEmpty)

          Column(

            children: List.generate(
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
                    horizontal: 16,
                    vertical: 14,
                  ),

                  decoration: BoxDecoration(

                    color:
                    const Color(0xFFF8FAFC),

                    borderRadius:
                    BorderRadius.circular(
                      16,
                    ),
                  ),

                  child: Row(

                    children: [

                      Expanded(

                        child: Text(

                          item['name'] ?? '',

                          style:
                          const TextStyle(

                            fontSize: 15,

                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),

                      Text(

                        "${item['weight']} KG",

                        style:
                        const TextStyle(

                          color: Colors.green,

                          fontWeight:
                          FontWeight.bold,

                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  /// =========================
  /// METRIC CARD
  /// =========================

  Widget _metricCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Row(

        children: [

          Container(

            padding:
            const EdgeInsets.all(12),

            decoration: BoxDecoration(

              color:
              color.withValues(
                alpha: 0.10,
              ),

              borderRadius:
              BorderRadius.circular(
                14,
              ),
            ),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  title,

                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 4),

                Text(

                  value,

                  style: const TextStyle(

                    fontWeight:
                    FontWeight.bold,

                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// =========================
  /// STATUS CHIP
  /// =========================

  Widget _statusChip(
      String status,
      ) {

    return Container(

      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),

      decoration: BoxDecoration(

        color:
        Colors.blue.withValues(
          alpha: 0.10,
        ),

        borderRadius:
        BorderRadius.circular(
          30,
        ),
      ),

      child: Text(

        status,

        style: const TextStyle(

          color: Colors.blue,

          fontWeight:
          FontWeight.w600,
        ),
      ),
    );
  }
}