import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:user_db_drift/data/sources/drift/connection/native.dart';
import 'package:user_db_drift/data/sources/drift/user_mapper.dart';
import 'package:user_db_drift/data/sources/drift/tables.dart';
import 'package:user_db_drift/data/sources/user_datasource.dart';
import 'package:user_db_drift/domain/entity/user.dart' as model;

part 'database.g.dart';

@LazySingleton(as: UserDatasource)
@DriftDatabase(tables: [Users])
class DatabaseImpl extends _$DatabaseImpl implements UserDatasource {
  DatabaseImpl() : super(connect());

  @override
  int get schemaVersion => 1;

  @override
  Future<List<model.User>> getUsers() =>
      select(users).get().then(UserMapper.toModelList);
  @override
  Stream<List<model.User>> watchUsers() =>
      select(users).watch().map(UserMapper.toModelList);

  @override
  Future<bool> addUser(model.User item) async {
    await into(users).insert(UsersCompanion.insert(
        firstname: item.firstname,
        lastname: item.lastname,
        birthday: item.birthday,
        phone: item.phone,
        card: item.card));
    return true;
  }

  @override
  Future<void> deleteUser(model.User item) async {
    if (item.userId == null) return;
    await (delete(users)..where((tbl) => tbl.userId.equals(item.userId!))).go();
  }

  @override
  Future<void> updateUser(model.User item) async {
    if (item.userId == null) return;
    await update(users).replace(UsersCompanion(
      userId: Value(item.userId!),
      firstname: Value(item.firstname),
      lastname: Value(item.lastname),
      birthday: Value(item.birthday),
      phone: Value(item.phone),
      card: Value(item.card),
    ));
  }

  @override
  Future<model.User> getUserById(int userId) {
    return (select(users)..where((tbl) => tbl.userId.equals(userId)))
        .getSingle()
        .then(UserMapper.toModel);
  }
}
