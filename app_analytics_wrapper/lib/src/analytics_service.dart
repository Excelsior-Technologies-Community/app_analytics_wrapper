import 'analytics_event.dart';

class AnalyticsService {

  Future<void> logEvent(AnalyticsEvent event) async {
    // Simulate sending to server
    print("📊 Analytics Event");
    print("Event Name : ${event.name}");

    if (event.parameters != null) {
      print("Parameters : ${event.parameters}");
    }

    print("--------------------------------------------------");
  }

  Future<void> logScreen(String screenName) async {
    print("🖥 Screen View : $screenName");
    print("--------------------------------------------------");
  }
}
