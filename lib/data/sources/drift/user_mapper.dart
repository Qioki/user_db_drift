import 'package:user_db_drift/data/sources/drift/database.dart';
import 'package:user_db_drift/domain/entity/user.dart' as model;

class UserMapper {
  static model.User toModel(User user) {
    return model.User(
      userId: user.userId,
      firstname: user.firstname,
      lastname: user.lastname,
      birthday: user.birthday,
      phone: user.phone,
      card: user.card,
    );
  }

  static List<model.User> toModelList(List<User> entities) {
    return entities.map(toModel).toList();
  }
}
