import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(copyWith: true)
class User with _$User {
  const factory User({
    int? userId,
    required String firstname,
    required String lastname,
    required DateTime birthday,
    required String phone,
    required String card,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
