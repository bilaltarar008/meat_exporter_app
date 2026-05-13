import 'package:flutter/material.dart';

import '../../core/services/firestore_provider.dart';
import '../../../../core/database/app_database.dart';

class ArchivedShipmentsScreen extends StatelessWidget {
  const ArchivedShipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Color(0xFF111827),
        ),

        title: const Text(
          'Archived Shipments',

          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: StreamBuilder<List<Map<String, dynamic>>>(

        stream: firestoreService.watchArchivedShipments(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final archivedData = snapshot.data!;

          final shipments = archivedData.map((data) {

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

          /// EMPTY STATE

          if (shipments.isEmpty) {

            return Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.archive_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'No Archived Shipments',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Archived shipments will appear here',

                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(

            padding: const EdgeInsets.all(16),

            itemCount: shipments.length,

            itemBuilder: (context, index) {

              final shipment = shipments[index];

              return Container(

                margin: const EdgeInsets.only(bottom: 14),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),

                child: Padding(

                  padding: const EdgeInsets.all(16),

                  child: Row(

                    children: [

                      /// ICON

                      Container(

                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: const Icon(
                          Icons.archive_outlined,
                          color: Colors.orange,
                          size: 28,
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// INFO

                      Expanded(

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              shipment.shipmentCode ??
                                  "Shipment",

                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF111827),
                              ),
                            ),

                            const SizedBox(height: 4),


                          ],
                        ),
                      ),

                      Column(
                        children: [

                          /// UNDO BUTTON

                          ElevatedButton.icon(

                            style: ElevatedButton.styleFrom(

                              backgroundColor:
                              const Color(0xFF2563EB),

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                            ),

                            onPressed: () async {

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
                                      "Restore Shipment",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    content: Text(
                                      'Restore "${shipment.title}" back to active shipments?',
                                    ),

                                    actions: [

                                      TextButton(

                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },

                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),

                                      ElevatedButton(

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),

                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },

                                        child: const Text(
                                          "Restore",
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

                              if (confirm != true) return;

                              await restoreShipment(
                                shipment.firestoreId!,
                              );

                              if (context.mounted) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  SnackBar(

                                    backgroundColor:
                                    Colors.red,

                                    behavior:
                                    SnackBarBehavior.floating,

                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),

                                    content: const Text(
                                      "Shipment restored successfully",

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                        FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },

                            icon: const Icon(
                              Icons.undo_rounded,
                              color: Colors.white,
                              size: 18,
                            ),

                            label: const Text(

                              "Undo",

                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          /// DELETE BUTTON

                          ElevatedButton.icon(

                            style: ElevatedButton.styleFrom(

                              backgroundColor: Colors.red,

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                            ),

                            onPressed: () async {

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
                                      "Delete Shipment",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    content: Text(
                                      'Are you sure you want to permanently delete "${shipment.title}" shipment?',
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
                                          backgroundColor: Colors.green,
                                        ),

                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },

                                        child: const Text(
                                          "Delete",
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

                              await firestoreService.deleteShipment(
                                shipment.firestoreId!,
                              );

                              if (context.mounted) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  const SnackBar(
                                    content: Text(
                                      "Shipment deleted permanently",
                                    ),
                                  ),
                                );
                              }
                            },

                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 18,
                            ),

                            label: const Text(

                              "Delete",

                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}