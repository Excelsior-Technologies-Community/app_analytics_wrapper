import 'package:flutter/widgets.dart';
import 'analytics_manager.dart';

class AnalyticsObserver extends NavigatorObserver {

  final AnalyticsManager _manager = AnalyticsManager();

  @override
  void didPush(Route route, Route? previousRoute) {
    _sendScreen(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) {
      _sendScreen(newRoute);
    }
  }

  void _sendScreen(Route route) {
    final screenName = route.settings.name ?? route.runtimeType.toString();
    _manager.trackScreen(screenName);
  }
}
