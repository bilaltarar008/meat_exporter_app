import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class ShipmentDetailScreen extends StatelessWidget {
  final Shipment shipment;

  const ShipmentDetailScreen({
    super.key,
    required this.shipment,
  });

  @override
  Widget build(BuildContext context) {

    final profit =
        shipment.salePrice - shipment.purchaseCost;

    final paymentPending =
        shipment.paymentStatus
            .toLowerCase() == 'pending';

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          shipment.shipmentCode ?? "Shipment",
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

            /// ================= ENTERPRISE HEADER =================

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(24),

                boxShadow: [

                  BoxShadow(
                    color:
                    Colors.black.withOpacity(0.04),

                    blurRadius: 12,

                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// TOP

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

                              shipment.shipmentCode ??
                                  "Shipment",

                              style: const TextStyle(

                                fontSize: 30,

                                fontWeight:
                                FontWeight.bold,

                                color:
                                Color(0xFF111827),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(

                              "${shipment.origin} → ${shipment.destination}",

                              style: const TextStyle(

                                fontSize: 16,

                                color:
                                Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),

                      _statusChip(
                        shipment.status,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// NEXT ACTION

                  Container(

                    width: double.infinity,

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color:
                      const Color(0xFFFFF7ED),

                      borderRadius:
                      BorderRadius.circular(16),

                      border: Border.all(
                        color:
                        Colors.orange.shade200,
                      ),
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

                          shipment.nextAction,

                          style: const TextStyle(

                            fontSize: 16,

                            fontWeight:
                            FontWeight.w600,

                            color:
                            Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// METRICS

                  Row(

                    children: [

                      Expanded(
                        child: _metricCard(
                          "Purchase",
                          "\$${shipment.purchaseCost.toStringAsFixed(0)}",
                          Icons.shopping_cart_outlined,
                          Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _metricCard(
                          "Sale",
                          "\$${shipment.salePrice.toStringAsFixed(0)}",
                          Icons.attach_money_rounded,
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
                          "${shipment.weight.toStringAsFixed(0)} kg",
                          Icons.scale_rounded,
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _metricCard(
                          "Profit",
                          "\$${profit.toStringAsFixed(0)}",
                          Icons.trending_up_rounded,
                          profit >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// PAYMENT

                  Container(

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color:
                      paymentPending

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

                          color:
                          paymentPending
                              ? Colors.orange
                              : Colors.green,
                        ),

                        const SizedBox(width: 12),

                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(

                                paymentPending
                                    ? "Payment Pending"
                                    : "Payment Completed",

                                style: TextStyle(

                                  fontWeight:
                                  FontWeight.bold,

                                  color:
                                  paymentPending
                                      ? Colors.orange
                                      : Colors.green,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(

                                paymentPending
                                    ? "Awaiting buyer payment"
                                    : "Payment received successfully",

                                style: const TextStyle(
                                  color:
                                  Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /// ================= TIMELINE =================

            const Text(

              "Shipment Timeline",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            _buildRealTimeline(),

            const SizedBox(height: 24),

            /// ================= WEIGHTS =================

            const Text(

              "Weights & Cuts",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            _infoCard(
              "Purchase Weight",
              "${shipment.purchaseWeight ?? 0} kg",
            ),

            _infoCard(
              "Carcass Weight",
              "${shipment.carcassWeight ?? 0} kg",
            ),

            _infoCard(
              "Net Sale Weight",
              "${shipment.netSaleWeight ?? 0} kg",
            ),

            const SizedBox(height: 24),

            /// ================= EXPENSES =================

            const Text(

              "Operational Expenses",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            _buildExpenseCard(
              "Animal Purchase",
              shipment.purchaseCost,
              Icons.shopping_cart_outlined,
              Colors.orange,
            ),

            _buildExpenseCard(
              "Slaughterhouse",
              shipment.slaughterhouseCost ?? 0,
              Icons.cut,
              Colors.red,
            ),

            _buildExpenseCard(
              "Cold Storage",
              shipment.coldStorageCost ?? 0,
              Icons.ac_unit_rounded,
              Colors.blue,
            ),

            _buildExpenseCard(
              "Freight Charges",
              shipment.freightCost ?? 0,
              Icons.flight_takeoff_rounded,
              Colors.green,
            ),

            _buildExpenseCard(
              "Airport Handling",
              shipment.airportHandlingCost ?? 0,
              Icons.local_shipping_outlined,
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

                    "\$${(
                        shipment.purchaseCost +
                            (shipment.slaughterhouseCost ?? 0) +
                            (shipment.coldStorageCost ?? 0) +
                            (shipment.freightCost ?? 0) +
                            (shipment.airportHandlingCost ?? 0)
                    ).toStringAsFixed(0)}",

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

            /// ================= NOTES =================

            const Text(

              "Operational Notes",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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

                shipment.notes ?? "No notes added",

                style: const TextStyle(
                  color: Color(0xFF374151),
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

  /// ================= TIMELINE TILE =================



  /// ================= ACTIVITY TILE =================

  Widget _activityTile({
    required String title,
    required String role,
    required DateTime createdAt,
    String? notes,
    bool isLast = false,
  }) {

    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        /// LEFT LINE
        Column(
          children: [

            Container(
              width: 18,
              height: 18,

              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 12,
              ),
            ),

            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: Colors.green,
              ),
          ],
        ),

        SizedBox(width: 14.w),

        /// RIGHT CONTENT
        Expanded(
          child: Padding(
            padding:
            EdgeInsets.only(bottom: 20.h),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: const TextStyle(
                    fontWeight:
                    FontWeight.bold,

                    fontSize: 14,

                    color:
                    Color(0xFF111827),
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  "By $role",

                  style: const TextStyle(
                    color:
                    Color(0xFF6B7280),

                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  createdAt.toString(),

                  style: const TextStyle(
                    color:
                    Color(0xFF9CA3AF),

                    fontSize: 11,
                  ),
                ),

                if (notes != null)
                  Padding(
                    padding:
                    EdgeInsets.only(top: 8.h),

                    child: Container(
                      width: double.infinity,

                      padding:
                      EdgeInsets.all(10.w),

                      decoration:
                      BoxDecoration(
                        color:
                        const Color(
                          0xFFF9FAFB,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),

                      child: Text(
                        notes,

                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
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

          Container(

            padding:
            const EdgeInsets.all(10),

            decoration: BoxDecoration(

              color:
              color.withOpacity(0.1),

              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(

            child: Text(

              title,

              style: const TextStyle(

                fontWeight:
                FontWeight.w600,

                fontSize: 15,
              ),
            ),
          ),

          Text(

            "\$${amount.toStringAsFixed(0)}",

            style: const TextStyle(

              fontWeight:
              FontWeight.bold,

              fontSize: 16,

              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timelineTile(
      String title,
      bool completed,
      ) {

    return Row(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Column(

          children: [

            CircleAvatar(

              radius: 10,

              backgroundColor:
              completed
                  ? Colors.green
                  : Colors.grey.shade300,

              child: Icon(

                completed
                    ? Icons.check
                    : Icons.circle,

                size: 12,

                color: Colors.white,
              ),
            ),

            Container(
              width: 2,
              height: 40,
              color: Colors.grey.shade300,
            ),
          ],
        ),

        const SizedBox(width: 14),

        Expanded(

          child: Padding(

            padding:
            const EdgeInsets.only(top: 2),

            child: Text(

              title,

              style: TextStyle(

                fontSize: 15,

                fontWeight:
                FontWeight.w600,

                color:
                completed
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRealTimeline() {

    final stages = [

      {
        "title": "Purchase Confirmed",
        "done": true,
        "active":
        shipment.currentStage == 'owner',
      },

      {
        "title": "Animals Slaughtered",
        "done":
        shipment.currentStage == 'slaughter' ||
            shipment.currentStage == 'warehouse' ||
            shipment.currentStage == 'completed',

        "active":
        shipment.currentStage == 'slaughter',
      },

      {
        "title": "Transferred To Warehouse",
        "done":
        shipment.currentStage == 'warehouse' ||
            shipment.currentStage == 'completed',

        "active":
        shipment.currentStage == 'warehouse',
      },

      {
        "title": "Shipment Completed",
        "done":
        shipment.currentStage == 'completed',

        "active":
        shipment.currentStage == 'completed',
      },
    ];

    return Column(

      children: List.generate(
        stages.length,
            (index) {

          final stage = stages[index];

          final done =
          stage['done'] as bool;

          final active =
          stage['active'] as bool;

          final isLast =
              index == stages.length - 1;

          return Row(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// LEFT SIDE
              Column(

                children: [

                  Container(

                    width: 24,
                    height: 24,

                    decoration: BoxDecoration(

                      shape: BoxShape.circle,

                      color:

                      done
                          ? Colors.green

                          : active
                          ? Colors.orange

                          : Colors.grey.shade300,
                    ),

                    child: Icon(

                      done
                          ? Icons.check

                          : active
                          ? Icons.schedule
                          : Icons.circle,

                      size: 14,

                      color: Colors.white,
                    ),
                  ),

                  if (!isLast)

                    Container(

                      width: 2,
                      height: 70,

                      color:
                      done
                          ? Colors.green
                          : Colors.grey.shade300,
                    ),
                ],
              ),

              const SizedBox(width: 16),

              /// RIGHT SIDE
              Expanded(

                child: Padding(

                  padding:
                  const EdgeInsets.only(
                    bottom: 22,
                  ),

                  child: Container(

                    padding:
                    const EdgeInsets.all(16),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(18),

                      border: Border.all(

                        color:

                        active
                            ? Colors.orange.shade200
                            : const Color(
                          0xFFE5E7EB,
                        ),
                      ),
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            Expanded(

                              child: Text(

                                stage['title']
                                as String,

                                style:
                                const TextStyle(

                                  fontWeight:
                                  FontWeight.bold,

                                  fontSize: 15,

                                  color:
                                  Color(
                                    0xFF111827,
                                  ),
                                ),
                              ),
                            ),

                            Container(

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),

                              decoration:
                              BoxDecoration(

                                color:

                                done

                                    ? Colors.green
                                    .withOpacity(0.1)

                                    : active

                                    ? Colors.orange
                                    .withOpacity(0.1)

                                    : Colors.grey
                                    .withOpacity(0.1),

                                borderRadius:
                                BorderRadius.circular(
                                  30,
                                ),
                              ),

                              child: Text(

                                done
                                    ? "Done"
                                    : active
                                    ? "In Progress"
                                    : "Pending",

                                style: TextStyle(

                                  fontSize: 11,

                                  fontWeight:
                                  FontWeight.bold,

                                  color:

                                  done
                                      ? Colors.green
                                      : active
                                      ? Colors.orange
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Text(

                          done

                              ? "Operation completed successfully"

                              : active

                              ? "Current operational stage"

                              : "Waiting for previous step",

                          style: const TextStyle(
                            color:
                            Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
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

        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: color,
          ),

          const SizedBox(height: 14),

          Text(

            title,

            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 6),

          Text(

            value,

            style: const TextStyle(

              fontWeight:
              FontWeight.bold,

              fontSize: 18,

              color:
              Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricBox(
      String title,
      String value,
      ) {

    return Column(

      children: [

        Text(

          title,

          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 4),

        Text(

          value,

          style: const TextStyle(

            fontWeight:
            FontWeight.bold,

            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _statusBadge(
      String text,
      Color color,
      ) {

    return Container(

      padding:
      const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        color: color.withOpacity(0.1),

        borderRadius:
        BorderRadius.circular(30),
      ),

      child: Text(

        text,

        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
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

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _documentTile(
      String title,
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

        children: [

          const Icon(
            Icons.description_outlined,
            color: Colors.blue,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          ElevatedButton(

            onPressed: () {},

            child: const Text(
              "Upload",
            ),
          ),
        ],
      ),
    );
  }

  /// ================= METRIC =================

  Widget _metric(
      String label,
      String value,
      ) {
    return Column(
      children: [

        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF9CA3AF),
          ),
        ),

        SizedBox(height: 5.h),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }

  /// ================= PROFIT =================

  Widget _profitMetric(double profit) {
    return Column(
      children: [

        const Text(
          "Profit",
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF9CA3AF),
          ),
        ),

        SizedBox(height: 5.h),

        Text(
          "\$${profit.toStringAsFixed(0)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: profit >= 0
                ? Colors.green
                : Colors.red,
          ),
        ),
      ],
    );
  }

  /// ================= STATUS CHIP =================

  Widget _statusChip(String status) {

    Color bg = Colors.blue.withOpacity(0.1);
    Color text = Colors.blue;

    if (status.toLowerCase().contains("completed")) {
      bg = Colors.green.withOpacity(0.1);
      text = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
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
          fontSize: 11,
        ),
      ),
    );
  }

  /// ================= PAYMENT CHIP =================

  Widget _paymentChip(String payment) {

    final pending =
        payment.toLowerCase() == 'pending';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: pending
            ? Colors.orange.withOpacity(0.1)
            : Colors.green.withOpacity(0.1),

        borderRadius:
        BorderRadius.circular(30),
      ),

      child: Text(
        pending
            ? "Payment Pending"
            : "Payment Cleared",

        style: TextStyle(
          color: pending
              ? Colors.orange
              : Colors.green,

          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }

  /// ================= ACTION BUTTON =================

  Widget _actionButton(
      BuildContext context, {
        required IconData icon,
        required String title,
        required Color color,
        required VoidCallback onTap,
      }) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton.icon(
        onPressed: onTap,

        icon: Icon(
          icon,
          color: Colors.white,
        ),

        label: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
          ),

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}