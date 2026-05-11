import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class WarehouseHomeScreen extends StatelessWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const bgColor = Color(0xFFF8FAFC);
    const green = Color(0xFF16A34A);
    const blue = Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        title: const Text(
          "Warehouse Operations",
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF0F172A),
            ),
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body: StreamBuilder<List<Shipment>>(
        stream: db.watchWarehouseShipments(),

        builder: (context, snapshot) {

          final shipments = snapshot.data ?? [];

          if (shipments.isEmpty) {
            return const Center(
              child: Text(
                "No warehouse shipments",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: shipments.length,

            itemBuilder: (_, i) {

              final s = shipments[i];

              return Container(
                margin: EdgeInsets.only(bottom: 16.h),

                padding: EdgeInsets.all(18.w),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    /// HEADER
                    Row(
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                s.shipmentCode ?? "Shipment",

                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color:
                                  const Color(0xFF0F172A),
                                ),
                              ),

                              SizedBox(height: 4.h),

                              Text(
                                s.title,

                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color:
                                  const Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),

                          decoration: BoxDecoration(
                            color:
                            green.withOpacity(0.1),

                            borderRadius:
                            BorderRadius.circular(30),
                          ),

                          child: Text(
                            "Ready",

                            style: TextStyle(
                              color: green,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    /// INFO
                    Row(
                      children: [

                        Expanded(
                          child: _infoBox(
                            "Weight",
                            "${s.weight} kg",
                            Icons.scale_rounded,
                            blue,
                          ),
                        ),

                        SizedBox(width: 10.w),

                        Expanded(
                          child: _infoBox(
                            "Payment",
                            s.paymentStatus,
                            Icons.payments_rounded,
                            green,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    /// WAREHOUSE STATUS
                    Container(
                      width: double.infinity,

                      padding: EdgeInsets.all(14.w),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),

                        borderRadius:
                        BorderRadius.circular(16),

                        border: Border.all(
                          color:
                          const Color(0xFFBBF7D0),
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Row(
                            children: [

                              const Icon(
                                Icons.inventory_2_outlined,
                                color: green,
                              ),

                              SizedBox(width: 8.w),

                              Text(
                                "Warehouse Status",

                                style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold,
                                  fontSize: 13.sp,
                                  color: green,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10.h),

                          const Text(
                            "• Shipment ready for receiving",
                          ),

                          SizedBox(height: 4.h),

                          const Text(
                            "• Verify cold-chain condition",
                          ),

                          SizedBox(height: 4.h),

                          const Text(
                            "• Confirm weight accuracy",
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// BUTTONS
                    Row(
                      children: [

                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},

                            icon: const Icon(
                              Icons.photo_camera_outlined,
                            ),

                            label: const Text(
                              "Upload",
                            ),

                            style:
                            OutlinedButton.styleFrom(
                              foregroundColor: blue,

                              side:
                              const BorderSide(
                                color: blue,
                              ),

                              padding:
                              EdgeInsets.symmetric(
                                vertical: 12.h,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  14,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {

                              await db.completeWarehouse(
                                s.id,
                              );
                            },

                            icon: const Icon(
                              Icons.check_circle,
                            ),

                            label: const Text(
                              "Confirm Receipt",
                            ),

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor: green,

                              foregroundColor:
                              Colors.white,

                              elevation: 0,

                              padding:
                              EdgeInsets.symmetric(
                                vertical: 12.h,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _infoBox(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {

    return Container(
      padding: EdgeInsets.all(14.w),

      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
              BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: color,
              size: 18,
            ),
          ),

          SizedBox(width: 10.w),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF64748B),
                ),
              ),

              SizedBox(height: 2.h),

              Text(
                value,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}