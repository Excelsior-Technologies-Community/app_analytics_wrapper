class AnalyticsEvent {
  final String name;
  final Map<String, dynamic>? parameters;

  AnalyticsEvent({
    required this.name,
    this.parameters,
  });
}
