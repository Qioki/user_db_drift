import 'package:user_db_drift/domain/entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Stream<List<User>> watchUsers();
  Future<void> addUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(User user);
  Future<User> getUserById(int userId);
}
