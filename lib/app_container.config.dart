// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'bmi_app.dart' as _i10;
import 'common/configuration.dart' as _i3;
import 'module/app_module.dart' as _i21;
import 'service/database_service.dart' as _i12;
import 'service/logging/logger.dart' as _i5;
import 'service/navigation/navigation_service.dart' as _i6;
import 'view/history_view.dart' as _i20;
import 'view/home_view.dart' as _i18;
import 'view/info_view.dart' as _i13;
import 'view/input_view.dart' as _i14;
import 'view/result_view.dart' as _i19;
import 'view/splash_view.dart' as _i16;
import 'viewmodel/history_view_model.dart' as _i17;
import 'viewmodel/home_view_model.dart' as _i11;
import 'viewmodel/info_view_model.dart' as _i7;
import 'viewmodel/input_view_model.dart' as _i8;
import 'viewmodel/result_view_model.dart' as _i15;
import 'viewmodel/splash_view_model.dart' as _i9;

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
  gh.factory<_i7.InfoViewModel>(
      () => _i7.InfoViewModel(get<_i6.INavigationService>()));
  gh.factory<_i8.InputViewModel>(() =>
      _i8.InputViewModel(get<_i6.INavigationService>(), get<_i5.ILogger>()));
  gh.factory<_i9.SplashViewModel>(
      () => _i9.SplashViewModel(get<_i6.INavigationService>()));
  gh.factory<_i10.BmiApp>(() => _i10.BmiApp(get<_i6.INavigationService>(),
      get<_i5.ILogger>(), get<_i3.Configuration>()));
  gh.factory<_i11.HomeViewModel>(
      () => _i11.HomeViewModel(get<_i6.INavigationService>()));
  gh.factory<_i12.IDatabaseService>(
      () => _i12.DatabaseService(get<_i3.Configuration>(), get<_i5.ILogger>()));
  gh.factory<_i13.InfoView>(() => _i13.InfoView(get<_i7.InfoViewModel>()));
  gh.factory<_i14.InputView>(() => _i14.InputView(get<_i8.InputViewModel>()));
  gh.factory<_i15.ResultViewModel>(() => _i15.ResultViewModel(
      get<_i6.INavigationService>(),
      get<_i12.IDatabaseService>(),
      get<_i5.ILogger>()));
  gh.factory<_i16.SplashView>(
      () => _i16.SplashView(get<_i9.SplashViewModel>()));
  gh.factory<_i17.HistoryViewModel>(() => _i17.HistoryViewModel(
      get<_i6.INavigationService>(),
      get<_i12.IDatabaseService>(),
      get<_i5.ILogger>()));
  gh.factory<_i18.HomeView>(() => _i18.HomeView(get<_i11.HomeViewModel>()));
  gh.factory<_i19.ResultView>(
      () => _i19.ResultView(get<_i15.ResultViewModel>()));
  gh.factory<_i20.HistoryView>(
      () => _i20.HistoryView(get<_i17.HistoryViewModel>()));
  return get;
}

class _$AppModule extends _i21.AppModule {}
