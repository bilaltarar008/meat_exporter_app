import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 280,

      color: const Color(0xFF06281D),

      child: const Column(
        children: [

          SizedBox(height: 40),

          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Text(
              'Control Tower',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.local_shipping,
              color: Colors.white,
            ),
            title: Text(
              'Shipments',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Sidebar(),
    );
  }
}