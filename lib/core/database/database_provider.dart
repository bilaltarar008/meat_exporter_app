import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database_mobile.dart'
if (dart.library.html) 'database_web.dart';

final dbProvider = Provider((ref) {
  return getDatabase();
});