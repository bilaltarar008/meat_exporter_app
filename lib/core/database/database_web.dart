class FakeDatabase {
  Future<List<dynamic>> getAllShipments() async {
    return [];
  }
}

FakeDatabase getDatabase() {
  return FakeDatabase();
}