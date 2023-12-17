import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:user_db_drift/domain/entity/user.dart';
import 'package:user_db_drift/domain/repository/user_repository.dart';

part 'user_form_state.dart';
part 'user_form_cubit.freezed.dart';

@injectable
class UserFormCubit extends Cubit<UserFormState> {
  final UserRepository userRepository;
  Map<String, dynamic> formData = {};

  FormGroup get form => fb.group(<String, Object>{
        'firstname': [formData['firstname'] ?? '', Validators.required],
        'lastname': [formData['lastname'] ?? '', Validators.required],
        'birthday': [
          formData['birthday'] != null
              ? formData['birthday'] is String
                  ? DateTime.parse(formData['birthday'])
                  : formData['birthday']
              : DateTime.now(),
          Validators.required
        ],
        'phone': [formData['phone'] ?? '', Validators.required],
        'card': [formData['card'] ?? '', Validators.required],
      });

  UserFormCubit(this.userRepository) : super(const UserFormState.initial());

  Future<void> addUser(Map<String, Object?> value) async {
    await userRepository.addUser(
        User.fromJson({...value, 'birthday': value['birthday'].toString()}));
  }

  Future<void> updateUser(int userId, Map<String, Object?> value) async {
    await userRepository.updateUser(User.fromJson({
      'userId': userId,
      ...value,
      'birthday': value['birthday'].toString()
    }));
  }

  Future<FormGroup> getUserForm(int? userId) async {
    if (userId != null) {
      User user = await userRepository.getUserById(userId);
      formData = user.toJson();
    } else {
      formData = {};
    }
    return form;
  }
}
