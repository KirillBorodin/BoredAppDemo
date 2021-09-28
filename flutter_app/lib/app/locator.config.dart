// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/local/bored_database.dart' as _i6;
import '../data/remote/bored_api.dart' as _i5;
import '../data/repository_impl/action_repository_impl.dart' as _i4;
import '../di/api_module.dart' as _i7;
import '../di/database_module.dart' as _i8;
import '../domain/repository/action_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<_i3.ActionRepository>(() => _i4.ActionRepositoryImpl());
  gh.lazySingleton<_i5.BoredApi>(() => apiModule.bubblesApi);
  await gh.factoryAsync<_i6.BoredDatabase>(() => databaseModule.database,
      preResolve: true);
  return get;
}

class _$ApiModule extends _i7.ApiModule {}

class _$DatabaseModule extends _i8.DatabaseModule {}
