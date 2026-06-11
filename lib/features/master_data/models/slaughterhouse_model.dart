class SlaughterhouseModel {

  final String id;
  final String name;

  SlaughterhouseModel({
    required this.id,
    required this.name,
  });

  factory SlaughterhouseModel.fromMap(
      String id,
      Map<String, dynamic> map,
      ) {

    return SlaughterhouseModel(
      id: id,
      name: map['name'] ?? '',
    );
  }
}