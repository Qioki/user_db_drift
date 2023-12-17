import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

Future<File> get databaseFile async {
  var dbFolder = await getApplicationDocumentsDirectory();
  final dbFile = File(p.join(dbFolder.path, 'users.db'));
  if (!dbFile.existsSync()) {
    dbFile.createSync();
  }
  return dbFile;
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();

      final cachebase = (await getTemporaryDirectory()).path;

      sqlite3.tempDirectory = cachebase;
    }

    return NativeDatabase.createBackgroundConnection(
      await databaseFile,
    );
  }));
}
