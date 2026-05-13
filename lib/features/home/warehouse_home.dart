import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/services/firestore_provider.dart';

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

            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),

            onPressed: () =>
                FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body:
      StreamBuilder<List<Map<String, dynamic>>>(

        stream:
        firestoreService
            .watchWarehouseShipments(),

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final firestoreShipments =
              snapshot.data ?? [];

          final shipments =
          firestoreShipments.map((data) {

            return Shipment(

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

              carcassWeight: 0,

              netSaleWeight: 0,

              nextAction:
              data['nextAction'] ??
                  'Continue Processing',

              paymentStatus:
              data['paymentStatus'] ?? 'pending',

              paymentDue: null,

              paymentReceivedDate: null,

              outstandingBalance: 0,

              purchaseCost:
              (data['purchaseCost'] ?? 0).toDouble(),

              salePrice:
              (data['salePrice'] ?? 0).toDouble(),

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

          }).toList();

          if (shipments.isEmpty) {

            return const Center(
              child: Text(
                "No warehouse shipments",
              ),
            );
          }

          return ListView.builder(

            padding:
            EdgeInsets.all(16.w),

            itemCount:
            shipments.length,

            itemBuilder: (_, i) {

              final s =
              shipments[i];

              return Container(

                margin:
                EdgeInsets.only(
                  bottom: 16.h,
                ),

                padding:
                EdgeInsets.all(18.w),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                    22,
                  ),

                  border: Border.all(
                    color:
                    const Color(
                      0xFFE2E8F0,
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

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [

                              Text(

                                s.shipmentCode ??
                                    "Shipment",

                                style: TextStyle(
                                  fontSize:
                                  18.sp,

                                  fontWeight:
                                  FontWeight.bold,

                                  color:
                                  const Color(
                                    0xFF0F172A,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 4.h,
                              ),

                              Text(

                                s.title,

                                style: TextStyle(
                                  fontSize:
                                  13.sp,

                                  color:
                                  const Color(
                                    0xFF64748B,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(

                          padding:
                          EdgeInsets.symmetric(
                            horizontal:
                            12.w,

                            vertical:
                            6.h,
                          ),

                          decoration:
                          BoxDecoration(

                            color:
                            green.withOpacity(
                              0.1,
                            ),

                            borderRadius:
                            BorderRadius.circular(
                              30,
                            ),
                          ),

                          child: Text(

                            "Ready",

                            style: TextStyle(
                              color:
                              green,

                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

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
                            "Status",
                            s.status,
                            Icons.inventory_2,
                            green,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    SizedBox(

                      width:
                      double.infinity,

                      child:
                      ElevatedButton.icon(

                        onPressed:
                            () async {

                          await firestoreService
                              .completeShipment(
                            s.firestoreId!,
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

                          backgroundColor:
                          green,

                          foregroundColor:
                          Colors.white,

                          padding:
                          EdgeInsets.symmetric(
                            vertical:
                            14.h,
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

      padding:
      EdgeInsets.all(14.w),

      decoration: BoxDecoration(

        color:
        const Color(0xFFF8FAFC),

        borderRadius:
        BorderRadius.circular(16),
      ),

      child: Row(

        children: [

          Icon(
            icon,
            color: color,
            size: 18,
          ),

          SizedBox(width: 10.w),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  title,

                  style:
                  const TextStyle(
                    fontSize: 11,
                    color:
                    Color(0xFF64748B),
                  ),
                ),

                SizedBox(height: 2.h),

                Text(

                  value,

                  overflow:
                  TextOverflow.ellipsis,

                  style:
                  const TextStyle(
                    fontWeight:
                    FontWeight.bold,
                    color:
                    Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}