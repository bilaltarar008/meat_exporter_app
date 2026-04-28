import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String text;

  const AlertCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.warning, color: Colors.red),
        title: Text(text),
      ),
    );
  }
}