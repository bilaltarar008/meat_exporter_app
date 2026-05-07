import 'package:flutter/material.dart';

class ShipmentRow extends StatelessWidget {
  final String id;

  const ShipmentRow({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(id),
      // subtitle: const Text("Pakistan → Dubai", style: TextStyle(color: Colors.blue),),
      trailing: const Text("In Transit", style: TextStyle(color: Colors.blue),),
    );
  }
}