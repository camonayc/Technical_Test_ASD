import 'dart:developer' as developer;

class Logger {
  static void log(String message) {
    developer.log('[LOG] $message');
  }

  static void error(String message, {String? name}) {
    developer.log(
      '[ERROR ${name != null ? '($name)' : ''}] $message',
      level: 1000,
    );
  }

  static void warning(String message) {
    developer.log('[WARNING] $message', level: 900);
  }
}
