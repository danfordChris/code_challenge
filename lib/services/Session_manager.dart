import 'package:code_challenge/core/mixins/logger_mixin.dart';
import 'package:code_challenge/shared/controllers/settings_controller.dart';

class SessionManager with LoggerMixin {
  SessionManager._();

  static final SessionManager _instance = SessionManager._();

  static SessionManager get instance => _instance;

  late String _deviceId;
  String get deviceId => _deviceId;

  Language? _currentLanguage;
  Language get locale => _currentLanguage ?? Language.english;

  void setLanguage(Language language) {
    _currentLanguage = language;
  }

  static void handleError(Object exception) {
    _handleError(exception);
  }

  static void showError(Object exception) {
    _handleError(exception);
  }

  static void _handleError(Object exception) {
    String formattedError = exception.toString().replaceAll("Exception: ", "");
    // AppAlert.show(message: formattedError, type: AlertType.error);
  }
}
