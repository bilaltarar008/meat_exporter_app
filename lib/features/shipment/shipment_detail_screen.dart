import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShipmentDetailScreen extends StatelessWidget {

  final Map<String, dynamic> shipment;

  const ShipmentDetailScreen({
    super.key,
    required this.shipment,
  });

  @override
  Widget build(BuildContext context) {

    final double purchaseCost =
    (shipment['purchaseCost'] ?? 0).toDouble();

    final double salePrice =
    (shipment['salePrice'] ?? 0).toDouble();

    final double weight =
    (shipment['weight'] ?? 0).toDouble();

    final double slaughterhouseCost =
    (shipment['slaughterhouseCost'] ?? 0).toDouble();

    final double coldStorageCost =
    (shipment['coldStorageCost'] ?? 0).toDouble();

    final double freightCost =
    (shipment['freightCost'] ?? 0).toDouble();

    final double airportHandlingCost =
    (shipment['airportHandlingCost'] ?? 0).toDouble();

    final profit = salePrice - purchaseCost;

    final totalOperationalCost =
        purchaseCost +
            slaughterhouseCost +
            coldStorageCost +
            freightCost +
            airportHandlingCost;

    final paymentPending =
        (shipment['paymentStatus'] ?? '')
            .toString()
            .toLowerCase() == 'pending';

    return Scaffold(

      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: Colors.white,

        foregroundColor: Colors.black,

        title: Text(

          shipment['shipmentCode'] ?? "Shipment",

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// HEADER

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

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

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              shipment['shipmentCode'] ??
                                  "Shipment",

                              style: const TextStyle(

                                fontSize: 28,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(

                              "${shipment['originCity'] ?? ''}, ${shipment['originCountry'] ?? ''}"
                                  " → "
                                  "${shipment['destinationCity'] ?? ''}, ${shipment['destinationCountry'] ?? ''}",

                              style: const TextStyle(
                                color: Colors.grey,
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

                  const SizedBox(height: 20),

                  Container(

                    width: double.infinity,

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color:
                      const Color(0xFFFFF7ED),

                      borderRadius:
                      BorderRadius.circular(16),
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(

                          "Next Action",

                          style: TextStyle(

                            color: Colors.orange,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(

                          shipment['nextAction'] ??
                              '',

                          style: const TextStyle(

                            fontWeight:
                            FontWeight.w600,

                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(

                    children: [

                      Expanded(
                        child: _metricCard(
                          "Purchase",
                          "\$${purchaseCost.toStringAsFixed(0)}",
                          Icons.shopping_cart_outlined,
                          Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _metricCard(
                          "Sale",
                          "\$${salePrice.toStringAsFixed(0)}",
                          Icons.attach_money,
                          Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(

                    children: [

                      Expanded(
                        child: _metricCard(
                          "Weight",
                          "${weight.toStringAsFixed(0)} kg",
                          Icons.scale,
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _metricCard(
                          "Profit",
                          "\$${profit.toStringAsFixed(0)}",
                          Icons.trending_up,
                          profit >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: paymentPending
                          ? Colors.orange.withOpacity(0.08)
                          : Colors.green.withOpacity(0.08),

                      borderRadius:
                      BorderRadius.circular(16),
                    ),

                    child: Row(

                      children: [

                        Icon(

                          paymentPending
                              ? Icons.pending_actions
                              : Icons.check_circle,

                          color: paymentPending
                              ? Colors.orange
                              : Colors.green,
                        ),

                        const SizedBox(width: 12),

                        Expanded(

                          child: Text(

                            paymentPending
                                ? "Payment Pending"
                                : "Payment Completed",

                            style: TextStyle(

                              fontWeight:
                              FontWeight.bold,

                              color: paymentPending
                                  ? Colors.orange
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// TIMELINE

            const Text(

              "Shipment Timeline",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            _buildFirestoreTimeline(),

            const SizedBox(height: 24),

            /// WEIGHTS

            const Text(

              "Weights & Cuts",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            _infoCard(
              "Purchase Weight",
              "${shipment['purchaseWeight'] ?? 0} kg",
            ),

            _infoCard(
              "Carcass Weight",
              "${shipment['carcassWeight'] ?? 0} kg",
            ),

            _infoCard(
              "Net Sale Weight",
              "${shipment['netSaleWeight'] ?? 0} kg",
            ),

            const SizedBox(height: 24),

            /// EXPENSES

            const Text(

              "Operational Expenses",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

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

            _buildExpenseCard(
              "Cold Storage",
              coldStorageCost,
              Icons.ac_unit,
              Colors.blue,
            ),

            _buildExpenseCard(
              "Freight Charges",
              freightCost,
              Icons.flight_takeoff,
              Colors.green,
            ),

            _buildExpenseCard(
              "Airport Handling",
              airportHandlingCost,
              Icons.local_shipping,
              Colors.purple,
            ),

            const SizedBox(height: 18),

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(18),

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

            /// NOTES

            const Text(

              "Operational Notes",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(16),
              ),

              child: Text(

                shipment['notes'] ??
                    "No notes added",

                style: const TextStyle(
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFirestoreTimeline() {

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

          final item = timeline[index];

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

    if (createdAt != null) {

      DateTime date;

      if (createdAt is Timestamp) {

        date = createdAt.toDate();

      } else {

        date = DateTime.now();
      }

      formattedDate =
      "${date.day.toString().padLeft(2, '0')}/"
          "${date.month.toString().padLeft(2, '0')}/"
          "${date.year}  •  "
          "${date.hour.toString().padLeft(2, '0')}:"
          "${date.minute.toString().padLeft(2, '0')}";
    }

    return Container(

      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const CircleAvatar(
            radius: 8,
            backgroundColor: Colors.green,
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

                    fontWeight: FontWeight.bold,

                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                ),

                const SizedBox(height: 10),

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
        ],
      ),
    );
  }

  Widget _buildExpenseCard(
      String title,
      double amount,
      IconData icon,
      Color color,
      ) {

    return Container(

      margin:
      const EdgeInsets.only(bottom: 12),

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Row(

        children: [

          Icon(icon, color: color),

          const SizedBox(width: 14),

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

  Widget _metricCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {

    return Container(

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

          Icon(icon, color: color),

          const SizedBox(height: 14),

          Text(title),

          const SizedBox(height: 6),

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
    );
  }

  Widget _infoCard(
      String title,
      String value,
      ) {

    return Container(

      margin:
      const EdgeInsets.only(bottom: 12),

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(16),
      ),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Text(title),

          Text(value),
        ],
      ),
    );
  }

  Widget _statusChip(String status) {

    Color bg = Colors.blue.withOpacity(0.1);
    Color text = Colors.blue;

    if (status.toLowerCase().contains("completed")) {

      bg = Colors.green.withOpacity(0.1);

      text = Colors.green;
    }

    return Container(

      padding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        color: bg,

        borderRadius:
        BorderRadius.circular(30),
      ),

      child: Text(

        status,

        style: TextStyle(
          color: text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}