// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as int?,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      phone: json['phone'] as String,
      card: json['card'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'birthday': instance.birthday.toIso8601String(),
      'phone': instance.phone,
      'card': instance.card,
    };
