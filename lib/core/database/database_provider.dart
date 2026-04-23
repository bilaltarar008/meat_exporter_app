import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});