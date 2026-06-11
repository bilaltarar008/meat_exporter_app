enum ShipmentStatus {

  purchaseConfirmed,

  animalsSlaughtered,

  cutsRecorded,

  coldStorage,

  loadedInVan,

  reachedAirport,

  awaitingFlight,

  inFlight,

  landed,

  warehouseReceived,

  delivered,

  paymentPending,

  paymentReceived,
}



extension ShipmentStatusExtension
on ShipmentStatus {

  String get label {

    switch (this) {


      case ShipmentStatus.purchaseConfirmed:
        return 'Purchase Confirmed';

      case ShipmentStatus.animalsSlaughtered:
        return 'Animals Slaughtered Note:';

      case ShipmentStatus.cutsRecorded:
        return 'Cuts & Weights Recorded';

      case ShipmentStatus.coldStorage:
        return 'In Cold Storage';

      case ShipmentStatus.loadedInVan:
        return 'Loaded In Chilling Van';

      case ShipmentStatus.reachedAirport:
        return 'Reached Airport';

      case ShipmentStatus.awaitingFlight:
        return 'Awaiting Flight Departure';

      case ShipmentStatus.inFlight:
        return 'In Flight';

      case ShipmentStatus.landed:
        return 'Landed At Destination';

      case ShipmentStatus.warehouseReceived:
        return 'Warehouse Received';

      case ShipmentStatus.delivered:
        return 'Delivered';

      case ShipmentStatus.paymentPending:
        return 'Payment Pending';

      case ShipmentStatus.paymentReceived:
        return 'Payment Received';
    }
  }
}