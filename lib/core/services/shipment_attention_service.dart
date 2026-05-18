import 'package:cloud_firestore/cloud_firestore.dart';


class ShipmentAttention {

  final String title;

  final String message;

  final String severity;

  final String shipmentCode;

  ShipmentAttention({

    required this.title,

    required this.message,

    required this.severity,

    required this.shipmentCode,
  });
}

class ShipmentAttentionService {

  List<ShipmentAttention> generateAlerts(
      List<Map<String, dynamic>> shipments,
      ) {

    final List<ShipmentAttention> alerts = [];

    for (final shipment in shipments) {

      final shipmentCode =
          shipment['shipmentCode'] ?? 'Shipment';

      final currentStage =
          shipment['currentStage'] ?? '';

      final paymentStatus =
          shipment['paymentStatus'] ?? '';

      final awb =
          shipment['awbNumber'] ?? '';

      final flight =
          shipment['flightNumber'] ?? '';

      final blocked =
          shipment['blocked'] ?? false;

      final salePrice =
      (shipment['salePrice'] ?? 0)
          .toDouble();

      /// BLOCKED

      if (blocked == true) {

        alerts.add(

          ShipmentAttention(

            title: 'Shipment Blocked',

            message:
            'Shipment requires immediate operational review.',

            severity: 'high',

            shipmentCode: shipmentCode,
          ),
        );
      }

      /// OVERDUE PAYMENT

      if (shipment['paymentDueDate'] != null &&
          paymentStatus != 'Completed') {

        final dueDate =
        shipment['paymentDueDate'];

        DateTime? paymentDue;

        if (dueDate is Timestamp) {

          paymentDue =
              dueDate.toDate();
        }

        if (paymentDue != null &&
            DateTime.now().isAfter(paymentDue)) {

          alerts.add(

            ShipmentAttention(

              title: 'Payment Overdue',

              message:
              'Customer payment is overdue.',

              severity: 'high',

              shipmentCode: shipmentCode,
            ),
          );
        }
      }

      /// AWB MISSING

      if (currentStage == 'transit' &&
          awb.toString().isEmpty) {

        alerts.add(

          ShipmentAttention(

            title: 'AWB Missing',

            message:
            'Upload airway bill before departure.',

            severity: 'high',

            shipmentCode: shipmentCode,
          ),
        );
      }

      /// FLIGHT MISSING

      if (currentStage == 'transit' &&
          flight.toString().isEmpty) {

        alerts.add(

          ShipmentAttention(

            title: 'Flight Details Missing',

            message:
            'Flight number not assigned.',

            severity: 'medium',

            shipmentCode: shipmentCode,
          ),
        );
      }

      /// SALE NOT RECORDED

      if (currentStage == 'delivered' &&
          salePrice <= 0) {

        alerts.add(

          ShipmentAttention(

            title: 'Sale Price Missing',

            message:
            'Shipment delivered but sale not recorded.',

            severity: 'medium',

            shipmentCode: shipmentCode,
          ),
        );
      }
    }

    return alerts;
  }
}