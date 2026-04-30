import 'app_database.dart';
import 'database_provider.dart';

AppDatabase getDatabase() {
  return db; // ✅ SAME INSTANCE
}