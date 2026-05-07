import 'package:flutter/material.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

class ArchivedShipmentsScreen extends StatelessWidget {
  const ArchivedShipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Shipments'),
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

          if (shipments.isEmpty) {
            return const Center(
              child: Text(
                'No archived shipments',
              ),
            );
          }

          return ListView.builder(
            itemCount: shipments.length,

            itemBuilder: (context, index) {

              final shipment = shipments[index];

              return Card(
                margin: const EdgeInsets.all(12),

                child: ListTile(
                  title: Text(
                    shipment.shipmentCode ?? '',
                  ),

                  subtitle: Text(
                    shipment.title,
                  ),

                  trailing: const Icon(
                    Icons.archive,
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