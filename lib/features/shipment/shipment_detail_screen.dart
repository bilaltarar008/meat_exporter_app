import 'package:flutter/material.dart';
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

    final totalOperationalCost =
        purchaseCost +
            slaughterhouseCost +
            coldStorageCost +
            freightCost +
            airportHandlingCost;

    final profit =
        salePrice -
            totalOperationalCost;

    final double totalPaid =
    (shipment['totalPaid'] ?? 0).toDouble();

    final double outstandingBalance =
        salePrice - totalPaid;

    final paymentStatus =
        shipment['paymentStatus'] ?? 'Pending';

    DateTime? paymentDueDate;

    final rawDueDate =
    shipment['paymentDueDate'];

    if (rawDueDate != null) {

      if (rawDueDate is Timestamp) {

        paymentDueDate =
            rawDueDate.toDate();

      } else if (rawDueDate is DateTime) {

        paymentDueDate =
            rawDueDate;
      }
    }

    final paymentPending =
        paymentStatus
            .toString()
            .toLowerCase() != 'completed';

    final isOverdue =
        paymentDueDate != null &&
            DateTime.now().isAfter(paymentDueDate!) &&
            paymentPending;

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

                  if (isOverdue)

                    Container(

                      width: double.infinity,

                      margin: const EdgeInsets.only(top: 14),

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(

                        color: Colors.red.withValues(alpha: 0.08),

                        borderRadius:
                        BorderRadius.circular(16),

                        border: Border.all(
                          color: Colors.red.shade200,
                        ),
                      ),

                      child: Row(

                        children: [

                          const Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                          ),

                          const SizedBox(width: 12),

                          Expanded(

                            child: Text(

                              "Payment is overdue. Immediate action required.",

                              style: TextStyle(

                                color: Colors.red.shade700,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

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
                          ? Colors.orange.withValues(alpha: 0.08)
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

            /// PAYMENT SUMMARY

            const Text(

              "Payment Summary",

              style: TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Column(

                children: [

                  _paymentRow(
                    "Total Sale",
                    "\$${salePrice.toStringAsFixed(0)}",
                  ),

                  const SizedBox(height: 14),

                  _paymentRow(
                    "Advance Received",
                    "\$${totalPaid.toStringAsFixed(0)}",
                  ),

                  const SizedBox(height: 14),

                  _paymentRow(
                    "Outstanding Balance",
                    "\$${outstandingBalance.toStringAsFixed(0)}",
                    valueColor:
                    outstandingBalance > 0
                        ? Colors.red
                        : Colors.green,
                  ),

                  const SizedBox(height: 14),

                  _paymentRow(

                    "Payment Status",

                    paymentStatus,

                    valueColor:

                    paymentStatus == 'Completed'

                        ? Colors.green

                        : paymentStatus == 'Overdue'

                        ? Colors.red

                        : Colors.orange,
                  ),

                  const SizedBox(height: 14),

                  _paymentRow(

                    "Due Date",

                    paymentDueDate == null

                        ? "Not Scheduled"

                        :

                    "${paymentDueDate.day}/${paymentDueDate.month}/${paymentDueDate.year}",
                  ),
                ],
              ),
            ),

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
            const SizedBox(height: 14),

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(

                color: profit >= 0

                    ? Colors.green.withValues(alpha: 0.08)

                    : Colors.red.withValues(alpha: 0.08),

                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const Text(

                    "Remaining Profit",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            const Text(
                              "Total Sale",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(

                              "\$${salePrice.toStringAsFixed(0)}",

                              style: const TextStyle(

                                fontWeight:
                                FontWeight.bold,

                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.center,

                          children: [

                            const Text(
                              "Expenses",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

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

                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                      ),

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.end,

                          children: [

                            const Text(
                              "Net Profit",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(

                              "\$${profit.toStringAsFixed(0)}",

                              style: TextStyle(

                                fontWeight:
                                FontWeight.bold,

                                fontSize: 20,

                                color:
                                profit >= 0
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

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

  Widget _paymentRow(
      String title,
      String value, {
        Color? valueColor,
      }) {

    return Row(

      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        Text(

          title,

          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        Text(

          value,

          style: TextStyle(

            fontWeight: FontWeight.bold,

            fontSize: 15,

            color:
            valueColor ??
                Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _statusChip(String status) {

    Color bg = Colors.blue.withValues(alpha: 0.1);
    Color text = Colors.blue;

    if (status.toLowerCase().contains("completed")) {

      bg = Colors.green.withValues(alpha: 0.1);

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