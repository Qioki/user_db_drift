// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstnameMeta =
      const VerificationMeta('firstname');
  @override
  late final GeneratedColumn<String> firstname = GeneratedColumn<String>(
      'firstname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastnameMeta =
      const VerificationMeta('lastname');
  @override
  late final GeneratedColumn<String> lastname = GeneratedColumn<String>(
      'lastname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
      'birthday', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardMeta = const VerificationMeta('card');
  @override
  late final GeneratedColumn<String> card = GeneratedColumn<String>(
      'card', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [userId, firstname, lastname, birthday, phone, card];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('firstname')) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableOrUnknown(data['firstname']!, _firstnameMeta));
    } else if (isInserting) {
      context.missing(_firstnameMeta);
    }
    if (data.containsKey('lastname')) {
      context.handle(_lastnameMeta,
          lastname.isAcceptableOrUnknown(data['lastname']!, _lastnameMeta));
    } else if (isInserting) {
      context.missing(_lastnameMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('card')) {
      context.handle(
          _cardMeta, card.isAcceptableOrUnknown(data['card']!, _cardMeta));
    } else if (isInserting) {
      context.missing(_cardMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      firstname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firstname'])!,
      lastname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lastname'])!,
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birthday'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      card: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int userId;
  final String firstname;
  final String lastname;
  final DateTime birthday;
  final String phone;
  final String card;
  const User(
      {required this.userId,
      required this.firstname,
      required this.lastname,
      required this.birthday,
      required this.phone,
      required this.card});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['firstname'] = Variable<String>(firstname);
    map['lastname'] = Variable<String>(lastname);
    map['birthday'] = Variable<DateTime>(birthday);
    map['phone'] = Variable<String>(phone);
    map['card'] = Variable<String>(card);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      firstname: Value(firstname),
      lastname: Value(lastname),
      birthday: Value(birthday),
      phone: Value(phone),
      card: Value(card),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['userId']),
      firstname: serializer.fromJson<String>(json['firstname']),
      lastname: serializer.fromJson<String>(json['lastname']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      phone: serializer.fromJson<String>(json['phone']),
      card: serializer.fromJson<String>(json['card']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'firstname': serializer.toJson<String>(firstname),
      'lastname': serializer.toJson<String>(lastname),
      'birthday': serializer.toJson<DateTime>(birthday),
      'phone': serializer.toJson<String>(phone),
      'card': serializer.toJson<String>(card),
    };
  }

  User copyWith(
          {int? userId,
          String? firstname,
          String? lastname,
          DateTime? birthday,
          String? phone,
          String? card}) =>
      User(
        userId: userId ?? this.userId,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        birthday: birthday ?? this.birthday,
        phone: phone ?? this.phone,
        card: card ?? this.card,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('birthday: $birthday, ')
          ..write('phone: $phone, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, firstname, lastname, birthday, phone, card);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.firstname == this.firstname &&
          other.lastname == this.lastname &&
          other.birthday == this.birthday &&
          other.phone == this.phone &&
          other.card == this.card);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<String> firstname;
  final Value<String> lastname;
  final Value<DateTime> birthday;
  final Value<String> phone;
  final Value<String> card;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastname = const Value.absent(),
    this.birthday = const Value.absent(),
    this.phone = const Value.absent(),
    this.card = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    required String firstname,
    required String lastname,
    required DateTime birthday,
    required String phone,
    required String card,
  })  : firstname = Value(firstname),
        lastname = Value(lastname),
        birthday = Value(birthday),
        phone = Value(phone),
        card = Value(card);
  static Insertable<User> custom({
    Expression<int>? userId,
    Expression<String>? firstname,
    Expression<String>? lastname,
    Expression<DateTime>? birthday,
    Expression<String>? phone,
    Expression<String>? card,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (firstname != null) 'firstname': firstname,
      if (lastname != null) 'lastname': lastname,
      if (birthday != null) 'birthday': birthday,
      if (phone != null) 'phone': phone,
      if (card != null) 'card': card,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userId,
      Value<String>? firstname,
      Value<String>? lastname,
      Value<DateTime>? birthday,
      Value<String>? phone,
      Value<String>? card}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      birthday: birthday ?? this.birthday,
      phone: phone ?? this.phone,
      card: card ?? this.card,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (firstname.present) {
      map['firstname'] = Variable<String>(firstname.value);
    }
    if (lastname.present) {
      map['lastname'] = Variable<String>(lastname.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (card.present) {
      map['card'] = Variable<String>(card.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('birthday: $birthday, ')
          ..write('phone: $phone, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseImpl extends GeneratedDatabase {
  _$DatabaseImpl(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
