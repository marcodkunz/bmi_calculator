// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'bmi_app.dart' as _i11;
import 'common/configuration.dart' as _i3;
import 'module/app_module.dart' as _i21;
import 'service/database_service.dart' as _i13;
import 'service/logging/logger.dart' as _i5;
import 'service/navigation/navigation_service.dart' as _i6;
import 'view/history_view.dart' as _i20;
import 'view/home_view.dart' as _i19;
import 'view/info_view.dart' as _i14;
import 'view/input_view.dart' as _i15;
import 'view/result_view.dart' as _i16;
import 'view/splash_view.dart' as _i17;
import 'viewmodel/history_view_model.dart' as _i18;
import 'viewmodel/home_view_model.dart' as _i12;
import 'viewmodel/info_view_model.dart' as _i7;
import 'viewmodel/input_view_model.dart' as _i8;
import 'viewmodel/result_view_model.dart' as _i9;
import 'viewmodel/splash_view_model.dart' as _i10;

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
  gh.factory<_i8.InputViewModel>(
      () => _i8.InputViewModel(get<_i6.INavigationService>()));
  gh.factory<_i9.ResultViewModel>(
      () => _i9.ResultViewModel(get<_i6.INavigationService>()));
  gh.factory<_i10.SplashViewModel>(
      () => _i10.SplashViewModel(get<_i6.INavigationService>()));
  gh.factory<_i11.BmiApp>(() => _i11.BmiApp(get<_i6.INavigationService>(),
      get<_i5.ILogger>(), get<_i3.Configuration>()));
  gh.factory<_i12.HomeViewModel>(
      () => _i12.HomeViewModel(get<_i6.INavigationService>()));
  gh.factory<_i13.IDatabaseService>(
      () => _i13.DatabaseService(get<_i3.Configuration>(), get<_i5.ILogger>()));
  gh.factory<_i14.InfoView>(() => _i14.InfoView(get<_i7.InfoViewModel>()));
  gh.factory<_i15.InputView>(() => _i15.InputView(get<_i8.InputViewModel>()));
  gh.factory<_i16.ResultView>(
      () => _i16.ResultView(get<_i9.ResultViewModel>()));
  gh.factory<_i17.SplashView>(
      () => _i17.SplashView(get<_i10.SplashViewModel>()));
  gh.factory<_i18.HistoryViewModel>(() => _i18.HistoryViewModel(
      get<_i6.INavigationService>(),
      get<_i13.IDatabaseService>(),
      get<_i5.ILogger>()));
  gh.factory<_i19.HomeView>(() => _i19.HomeView(get<_i12.HomeViewModel>()));
  gh.factory<_i20.HistoryView>(
      () => _i20.HistoryView(get<_i18.HistoryViewModel>()));
  return get;
}

class _$AppModule extends _i21.AppModule {}
