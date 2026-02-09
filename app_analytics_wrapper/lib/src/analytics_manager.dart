import 'analytics_event.dart';
import 'analytics_service.dart';

class AnalyticsManager {

  static final AnalyticsManager _instance = AnalyticsManager._internal();

  factory AnalyticsManager() {
    return _instance;
  }

  AnalyticsManager._internal();

  final AnalyticsService _service = AnalyticsService();

  // Track custom event
  Future<void> trackEvent(String name, {Map<String, dynamic>? params}) async {
    final event = AnalyticsEvent(name: name, parameters: params);
    await _service.logEvent(event);
  }

  // Track screen
  Future<void> trackScreen(String screenName) async {
    await _service.logScreen(screenName);
  }

  // Button click
  Future<void> trackClick(String buttonName) async {
    await _service.logEvent(
      AnalyticsEvent(
        name: "button_click",
        parameters: {"button": buttonName},
      ),
    );
  }

  // Error tracking
  Future<void> trackError(String message) async {
    await _service.logEvent(
      AnalyticsEvent(
        name: "app_error",
        parameters: {"error": message},
      ),
    );
  }
}
