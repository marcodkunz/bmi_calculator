import 'package:bmi_calculator/app_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
GetIt configureInjection(env) => $initGetIt(getIt, environment: env);

const devEnv = Environment(Env.dev);
const prodEnv = Environment(Env.prod);
const testEnv = Environment(Env.test);

abstract class Env {
  static const String dev = 'dev';
  static const String prod = 'prod';
  static const String test = 'test';
}
