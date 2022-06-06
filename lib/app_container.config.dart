// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'bmi_app.dart' as _i8;
import 'common/configuration.dart' as _i3;
import 'module/app_module.dart' as _i10;
import 'service/logging/logger.dart' as _i5;
import 'service/navigation/navigation_service.dart' as _i6;
import 'view/welcome_view.dart' as _i9;
import 'viewmodel/welcome_view_model.dart' as _i7;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.Configuration>(() => appModule.configuration(),
      registerFor: {_dev, _test});
  gh.factory<_i3.Configuration>(() => appModule.configurationProd(),
      registerFor: {_prod});
  gh.factory<_i4.GlobalKey<_i4.NavigatorState>>(
      () => appModule.navigationKey());
  gh.factory<_i5.ILogger>(() => _i5.DebugLogger(), registerFor: {_dev, _test});
  gh.factory<_i5.ILogger>(() => _i5.ProductionLogger(), registerFor: {_prod});
  gh.singleton<_i6.INavigationService>(_i6.NavigationService(
      get<_i5.ILogger>(), get<_i4.GlobalKey<_i4.NavigatorState>>()));
  gh.factory<_i7.WelcomeViewModel>(
      () => _i7.WelcomeViewModel(get<_i6.INavigationService>()));
  gh.factory<_i8.BmiApp>(() => _i8.BmiApp(get<_i6.INavigationService>(),
      get<_i5.ILogger>(), get<_i3.Configuration>()));
  gh.factory<_i9.WelcomeView>(
      () => _i9.WelcomeView(get<_i7.WelcomeViewModel>()));
  return get;
}

class _$AppModule extends _i10.AppModule {}
