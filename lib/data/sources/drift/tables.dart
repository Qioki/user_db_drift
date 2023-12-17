import 'package:drift/drift.dart';

class Users extends Table with AutoIncrementingPrimaryKey {
  TextColumn get firstname => text()();
  TextColumn get lastname => text()();
  DateTimeColumn get birthday => dateTime()();
  TextColumn get phone => text()();
  TextColumn get card => text()();
}

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get userId => integer().autoIncrement()();
}
