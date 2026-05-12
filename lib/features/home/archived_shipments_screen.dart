import 'package:flutter/material.dart';

import '../../../../core/database/database_provider.dart';
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

      body: StreamBuilder<List<Shipment>>(

        stream: db.watchArchivedShipments(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final shipments = snapshot.data!;

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

                            Text(
                              shipment.title,

                              style: const TextStyle(
                                color: Color(0xFF6B7280),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Container(

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),

                              decoration: BoxDecoration(
                                color:
                                Colors.orange.withOpacity(0.1),

                                borderRadius:
                                BorderRadius.circular(20),
                              ),

                              child: const Text(
                                "Archived",

                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// RESTORE BUTTON

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

                          await db.restoreShipment(
                            shipment.id,
                          );

                          if (context.mounted) {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              SnackBar(

                                backgroundColor:
                                Colors.green,

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