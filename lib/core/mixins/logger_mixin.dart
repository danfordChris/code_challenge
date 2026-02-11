import 'dart:developer';

import 'package:flutter/foundation.dart';

mixin LoggerMixin {
  void logInfo(String message) {
    if (kDebugMode) {
      log(message, name: runtimeType.toString(), level: 800);
    }
  }

  void logWarning(String message) {
    if (kDebugMode) {
      log(message, name: runtimeType.toString(), level: 900);
    }
  }

  void logError(String message, {Object? exception, StackTrace? stackTrace}) {
    if (kDebugMode) {
      log(message, name: runtimeType.toString(), level: 1000, error: exception, stackTrace: stackTrace);
    }
  }
}
