import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:user_db_drift/domain/entity/user.dart';
import 'package:user_db_drift/domain/repository/user_repository.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(const UserState.initial()) {
    userRepository.watchUsers().listen((users) {
      emit(UserState.success(users));
    });
  }

  Future<void> addUser(User user) => userRepository.addUser(user);

  Future<void> deleteUser(User user) => userRepository.deleteUser(user);
}
