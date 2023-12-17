part of 'user_form_cubit.dart';

@freezed
class UserFormState with _$UserFormState {
  const factory UserFormState.initial() = _Initial;
  const factory UserFormState.success(User item) = _Success;
}
