import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';

class ShipmentDetailScreen extends StatelessWidget {
  final Shipment shipment;

  const ShipmentDetailScreen({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    final profit = shipment.salePrice - shipment.purchaseCost;

    return Scaffold(
      appBar: AppBar(
        title: Text(shipment.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Status: ${shipment.status}"),
            const SizedBox(height: 10),

            Text("Stage: ${shipment.currentStage}"),
            const SizedBox(height: 20),

            Text("Weight: ${shipment.weight} kg"),
            Text("Purchase: \$${shipment.purchaseCost}"),
            Text("Sale: \$${shipment.salePrice}"),

            const SizedBox(height: 10),

            Text(
              "Profit: \$${profit}",
              style: TextStyle(
                color: profit >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}