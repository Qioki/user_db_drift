import 'package:injectable/injectable.dart';
import 'package:user_db_drift/data/sources/user_datasource.dart';
import 'package:user_db_drift/domain/entity/user.dart';
import 'package:user_db_drift/domain/repository/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImpl({required this.userDatasource});

  @override
  Future<void> addUser(User user) => userDatasource.addUser(user);

  @override
  Future<List<User>> getUsers() => userDatasource.getUsers();

  @override
  Stream<List<User>> watchUsers() => userDatasource.watchUsers();

  @override
  Future<void> deleteUser(User user) => userDatasource.deleteUser(user);

  @override
  Future<void> updateUser(User user) => userDatasource.updateUser(user);

  @override
  Future<User> getUserById(int userId) => userDatasource.getUserById(userId);
}
