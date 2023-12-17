import 'package:user_db_drift/domain/entity/user.dart' as model;

abstract class UserDatasource {
  Future<List<model.User>> getUsers();
  Stream<List<model.User>> watchUsers();
  Future<bool> addUser(model.User item);
  Future<void> deleteUser(model.User user);
  Future<void> updateUser(model.User user);
  Future<model.User> getUserById(int userId);
}
