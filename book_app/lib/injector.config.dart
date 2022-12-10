// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_app/controller/main_notifier.dart' as _i5;
import 'package:book_app/utils/api_service.dart' as _i4;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'utils/module/module.dart' as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.singleton<_i4.ApiServices>(_i4.ApiServices(gh<_i3.Dio>()));
  gh.factory<_i5.MainNotifier>(() => _i5.MainNotifier(gh<_i4.ApiServices>()));
  return getIt;
}

class _$DioModule extends _i6.DioModule {}
