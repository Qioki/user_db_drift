// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:user_db_drift/data/repository/user_repository.dart' as _i6;
import 'package:user_db_drift/data/sources/drift/database.dart' as _i4;
import 'package:user_db_drift/data/sources/user_datasource.dart' as _i3;
import 'package:user_db_drift/domain/repository/user_repository.dart' as _i5;
import 'package:user_db_drift/presentation/cubits/user/user_cubit.dart' as _i7;
import 'package:user_db_drift/presentation/cubits/user_form/user_form_cubit.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.UserDatasource>(() => _i4.DatabaseImpl());
    gh.lazySingleton<_i5.UserRepository>(
        () => _i6.UserRepositoryImpl(userDatasource: gh<_i3.UserDatasource>()));
    gh.factory<_i7.UserCubit>(() => _i7.UserCubit(gh<_i5.UserRepository>()));
    gh.factory<_i8.UserFormCubit>(
        () => _i8.UserFormCubit(gh<_i5.UserRepository>()));
    return this;
  }
}
