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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            /// ================= HEADER =================

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    shipment.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  /// ROUTE
                  Text(
                    "${shipment.origin} → ${shipment.destination}",
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  /// STATUS
                  Row(
                    children: [

                      _statusChip(
                        shipment.status,
                      ),

                      SizedBox(width: 10.w),

                      _paymentChip(
                        shipment.paymentStatus,
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  /// METRICS
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [

                      _metric(
                        "Weight",
                        "${shipment.weight} kg",
                      ),

                      _metric(
                        "Sale",
                        "\$${shipment.salePrice}",
                      ),

                      _metric(
                        "Cost",
                        "\$${shipment.purchaseCost}",
                      ),

                      _profitMetric(profit),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 22.h),

            /// ================= TIMELINE =================

            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Column(
                children: [

                  _timelineTile(
                    "Purchase Confirmed",
                    true,
                  ),

                  _timelineTile(
                    "Animals Sent to Slaughter",
                    shipment.currentStage != 'owner',
                  ),

                  _timelineTile(
                    "Slaughter Completed",
                    shipment.currentStage == 'warehouse' ||
                        shipment.currentStage == 'completed',
                  ),

                  _timelineTile(
                    "Warehouse Processing",
                    shipment.currentStage == 'warehouse' ||
                        shipment.currentStage == 'completed',
                  ),

                  _timelineTile(
                    "Shipment Completed",
                    shipment.currentStage == 'completed',
                    isLast: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 22.h),

            Container(
              padding: EdgeInsets.all(18.w),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(18),
              ),

              child: StreamBuilder<
                  List<ShipmentActivity>>(
                stream: db.watchActivities(
                  shipment.id,
                ),

                builder: (
                    context,
                    snapshot,
                    ) {

                  if (!snapshot.hasData) {
                    return const Center(
                      child:
                      CircularProgressIndicator(),
                    );
                  }

                  final activities =
                  snapshot.data!;

                  if (activities.isEmpty) {
                    return const Text(
                      "No activities yet",
                    );
                  }

                  return Column(
                    children: List.generate(
                      activities.length,
                          (index) {

                        final activity =
                        activities[index];

                        return _activityTile(
                          title:
                          activity.activity,

                          role:
                          activity.role,

                          notes:
                          activity.notes,

                          createdAt:
                          activity.createdAt,

                          isLast:
                          index ==
                              activities.length - 1,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            /// ================= ACTION PANEL =================

            const Text(
              "Operations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            SizedBox(height: 14.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(18),
              ),

              child: Column(
                children: [

                  _actionButton(
                    context,
                    icon: Icons.local_shipping,
                    title: "Update Shipment Status",
                    color: Colors.blue,
                    onTap: () {},
                  ),

                  SizedBox(height: 12.h),

                  _actionButton(
                    context,
                    icon: Icons.attach_file,
                    title: "Upload Documents",
                    color: Colors.orange,
                    onTap: () {},
                  ),

                  SizedBox(height: 12.h),

                  _actionButton(
                    context,
                    icon: Icons.attach_money,
                    title: "Add Expense",
                    color: Colors.green,
                    onTap: () {},
                  ),

                  SizedBox(height: 12.h),

                  _actionButton(
                    context,
                    icon: Icons.inventory_2_outlined,
                    title: "Archive Shipment",
                    color: Colors.red,
                    onTap: () async {

                      await db.archiveShipment(
                        shipment.id,
                      );

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  /// ================= TIMELINE TILE =================

  /// ================= TIMELINE TILE =================

  Widget _timelineTile(
      String title,
      bool done, {
        bool isLast = false,
      }) {

    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Column(
          children: [

            Container(
              width: 18,
              height: 18,

              decoration: BoxDecoration(
                color: done
                    ? Colors.green
                    : Colors.grey.shade300,

                shape: BoxShape.circle,
              ),

              child: done
                  ? const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              )
                  : null,
            ),

            if (!isLast)
              Container(
                width: 2,
                height: 45,
                color: done
                    ? Colors.green
                    : Colors.grey.shade300,
              ),
          ],
        ),

        SizedBox(width: 14.w),

        Padding(
          padding: const EdgeInsets.only(top: 1),

          child: Text(
            title,

            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,

              color: done
                  ? const Color(0xFF111827)
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

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