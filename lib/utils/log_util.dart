import 'package:logger/logger.dart';

/// A singleton class responsible for application logging.
///
/// This logger supports both detailed and simple log outputs by encapsulating
/// two [Logger] instances with different configurations.
class LogUtil {
  late Logger _traceLogger;
  late Logger _simpleLogger;
  static final LogUtil _instance = LogUtil._internals();

  /// Private constructor that initializes logger instances.
  ///
  /// [_simpleLogger] is configured with a shorter stack trace, while
  /// [_traceLogger] provides a more detailed output.
  LogUtil._internals() {
    // Displays the last method in the stack trace. Start from the 2nd index
    // to exclude AppLogger's own methods.
    _simpleLogger = Logger(
      printer: PrettyPrinter(stackTraceBeginIndex: 2, methodCount: 3),
    );
    // Displays more methods in the stack trace.
    _traceLogger = Logger(
      printer: PrettyPrinter(stackTraceBeginIndex: 1, methodCount: 6),
    );
  }

  /// Returns the singleton instance of [LogUtil].
  static LogUtil get instance => _instance;

  /// log a message with the given [level].
  ///
  /// [level] defines the log level using [Level] enum (e.g., [Level.trace], [Level.debug]).
  /// {@template log}
  /// [message] is the log message.
  /// [exception] optionally represents an exception that occurred.
  /// [stackTrace] optionally provides the stack trace of the error.
  /// [isLogTrace] defaults to false, but if set to true, uses the detailed
  /// logger configuration.
  /// {@endtemplate}
  void _log(
    Level level,
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = false,
  }) {
    final targetLogger = isLogTrace ? _traceLogger : _simpleLogger;
    targetLogger.log(level, message, error: exception, stackTrace: stackTrace);
  }

  /// Logs a message at the TRACE level.
  ///
  ///{@macro log}
  void t(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = false,
  }) => _log(
    Level.trace,
    message,
    exception: exception,
    stackTrace: stackTrace,
    isLogTrace: isLogTrace,
  );

  /// Logs a message at the DEBUG level.
  ///
  ///{@macro log}
  void d(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = false,
  }) => _log(
    Level.debug,
    message,
    exception: exception,
    stackTrace: stackTrace,
    isLogTrace: isLogTrace,
  );

  /// Logs a message at the INFO level.
  ///
  ///{@macro log}
  void i(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = false,
  }) => _log(
    Level.info,
    message,
    exception: exception,
    stackTrace: stackTrace,
    isLogTrace: isLogTrace,
  );

  /// Logs a message at the WARNING level.
  ///
  ///{@macro log}
  void w(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = false,
  }) => _log(
    Level.warning,
    message,
    exception: exception,
    stackTrace: stackTrace,
    isLogTrace: isLogTrace,
  );

  /// Logs a message at the ERROR level.
  ///
  ///{@macro log}
  void e(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = true,
  }) => _log(
    Level.error,
    message,
    exception: exception,
    stackTrace: stackTrace,
    isLogTrace: isLogTrace,
  );

  /// Logs a message at the FATAL level.
  ///
  ///{@macro log}
  void f(
    dynamic message, {
    Object? exception,
    StackTrace? stackTrace,
    bool isLogTrace = true,
  }) => _log(
    Level.fatal,
    message,
    exception: exception,
    stackTrace: stackTrace,
    isLogTrace: isLogTrace,
  );
}
