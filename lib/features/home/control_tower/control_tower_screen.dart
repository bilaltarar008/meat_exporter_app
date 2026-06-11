// import 'package:flutter/material.dart';
//
// import '../../../core/theme/responsive.dart';
//
// import 'widgets.dart';
//
// class ControlTowerScreen extends StatelessWidget {
//   const ControlTowerScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final isDesktop =
//     Responsive.isDesktop(context);
//
//     return Scaffold(
//
//       backgroundColor:
//       const Color(0xFFF5F6F7),
//
//       drawer:
//       isDesktop ? null : const AppDrawer(),
//
//       body: Row(
//         children: [
//
//           /// DESKTOP SIDEBAR
//           if (isDesktop)
//             const Sidebar(),
//
//           /// MAIN CONTENT
//           Expanded(
//             child: Column(
//               children: [
//
//                 /// TOP BAR
//                 Container(
//                   height: 80,
//                   padding:
//                   const EdgeInsets.symmetric(
//                     horizontal: 24,
//                   ),
//                   color: Colors.white,
//
//                   child: Row(
//                     children: [
//
//                       const Expanded(
//                         child: Text(
//                           'Shipment Control Tower',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight:
//                             FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       /// MOBILE MENU
//                       if (!isDesktop)
//                         Builder(
//                           builder: (context) {
//                             return IconButton(
//                               icon: const Icon(
//                                 Icons.menu,
//                               ),
//                               onPressed: () {
//                                 Scaffold.of(context)
//                                     .openDrawer();
//                               },
//                             );
//                           },
//                         ),
//                     ],
//                   ),
//                 ),
//
//                 /// YOUR EXISTING UI
//                 Expanded(
//                   child: YourCurrentShipmentUI(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }