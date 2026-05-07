import 'package:drift/drift.dart';

import 'database.dart';

QueryExecutor openConnection() {
  return createDatabaseConnection();
}