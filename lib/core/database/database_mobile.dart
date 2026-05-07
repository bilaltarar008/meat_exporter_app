import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

QueryExecutor createDatabaseConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();

    final path = p.join(dir.path, 'db.sqlite');

    final file = File(path);

    return NativeDatabase(file);
  });
}