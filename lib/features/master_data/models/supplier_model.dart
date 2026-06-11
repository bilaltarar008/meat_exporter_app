class SupplierModel {

  final String id;
  final String name;

  SupplierModel({
    required this.id,
    required this.name,
  });

  factory SupplierModel.fromMap(
      String id,
      Map<String, dynamic> map,
      ) {

    return SupplierModel(
      id: id,
      name: map['name'] ?? '',
    );
  }
}