import 'package:injectable/injectable.dart';

// ignore_for_file: avoid_print
abstract class ILogger {
  void log(LogSeverity severity, String tag, String message);

  void exception(String tag, Exception? ex, StackTrace? stackTrace);

  void error(String tag, dynamic ex, StackTrace stackTrace);

  void d(String tag, String message);

  void i(String tag, String message);

  void w(String tag, String message);

  void e(String tag, String message);
}

@Injectable(as: ILogger, env: [Environment.dev, Environment.test])
class DebugLogger implements ILogger {
  @override
  void log(LogSeverity severity, String tag, String message) {
    var currentTime = DateTime.now();
    print('[$currentTime] [${severity.toEnumString()}] $tag: $message');
  }

  @override
  void exception(String tag, Exception? ex, StackTrace? stackTrace) {
    var currentTime = DateTime.now();
    print(
        '[$currentTime] [${LogSeverity.exception.toEnumString()}] $tag: $ex\n$stackTrace');
  }

  @override
  void error(String tag, dynamic ex, StackTrace stackTrace) {
    var currentTime = DateTime.now();
    print(
        '[$currentTime] [${LogSeverity.exception.toEnumString()}] $tag: $ex\n$stackTrace');
  }

  @override
  void d(String tag, String message) {
    log(LogSeverity.debug, tag, message);
  }

  @override
  void i(String tag, String message) {
    log(LogSeverity.info, tag, message);
  }

  @override
  void w(String tag, String message) {
    log(LogSeverity.warning, tag, message);
  }

  @override
  void e(String tag, String message) {
    log(LogSeverity.error, tag, message);
  }
}

@Injectable(as: ILogger, env: [Environment.prod])
class ProductionLogger implements ILogger {
  @override
  void d(String tag, String message) {}

  @override
  void exception(String tag, Exception? ex, StackTrace? stackTrace) {
    var currentTime = DateTime.now();
    print(
        '[$currentTime] [${LogSeverity.exception.toEnumString()}] $tag: $ex\n$stackTrace');
  }

  @override
  void log(LogSeverity severity, String tag, String message) {
    var currentTime = DateTime.now();

    print('[$currentTime] [$severity] $tag: $message');
  }

  @override
  void error(String tag, dynamic ex, StackTrace stackTrace) {
    var currentTime = DateTime.now();
    print(
        '[$currentTime] [${LogSeverity.exception.toEnumString()}] $tag: $ex\n$stackTrace');
  }

  @override
  void i(String tag, String message) {
    log(LogSeverity.info, tag, message);
  }

  @override
  void w(String tag, String message) {
    log(LogSeverity.warning, tag, message);
  }

  @override
  void e(String tag, String message) {
    log(LogSeverity.error, tag, message);
  }
}

class NoLogger implements ILogger {
  @override
  void log(LogSeverity severity, String tag, String message) {}

  @override
  void exception(String tag, Exception? ex, StackTrace? stackTrace) {}

  @override
  void error(String tag, dynamic ex, StackTrace stackTrace) {}

  @override
  void d(String tag, String message) {
    log(LogSeverity.debug, tag, message);
  }

  @override
  void i(String tag, String message) {
    log(LogSeverity.info, tag, message);
  }

  @override
  void w(String tag, String message) {
    log(LogSeverity.warning, tag, message);
  }

  @override
  void e(String tag, String message) {
    log(LogSeverity.error, tag, message);
  }
}

enum LogSeverity { verbose, debug, info, warning, error, exception }

extension LogSeverityExtension on LogSeverity {
  String toEnumString() {
    return toString().substring(toString().indexOf('.') + 1);
  }
}
