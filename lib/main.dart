import 'package:flutter/material.dart';
import 'package:app_analytics_wrapper/app_analytics_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analytics Demo',
      debugShowCheckedModeBanner: false,

      // 🔥 AUTO SCREEN TRACKING
      navigatorObservers: [
        AnalyticsObserver(),
      ],

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // route name helps analytics observer
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  // analytics instance
  final AnalyticsManager analytics = AnalyticsManager();

  @override
  void initState() {
    super.initState();

    // manual screen tracking (optional)
    analytics.trackScreen("home_screen");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    // 🔥 Button click tracking
    analytics.trackClick("increment_fab");

    // 🔥 Custom event tracking
    analytics.trackEvent(
      "counter_incremented",
      params: {
        "counter_value": _counter,
        "time": DateTime.now().toString(),
      },
    );
  }

  void _goToSecondPage() {

    // track navigation click
    analytics.trackClick("open_second_page");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecondPage(),
        settings: const RouteSettings(name: "second_page"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _goToSecondPage,
              child: const Text("Go To Second Page"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {

    final analytics = AnalyticsManager();

    // screen tracked automatically by observer
    analytics.trackEvent("second_page_opened");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {

            // error tracking example
            analytics.trackError("Test error button pressed");

            Navigator.pop(context);
          },
          child: const Text("Go Back (Send Error Event)"),
        ),
      ),
    );
  }
}
