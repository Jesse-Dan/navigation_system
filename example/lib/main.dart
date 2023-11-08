import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/navigation_system.dart';

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

/// The state for the main application widget.
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// The `MaterialApp` widget, which is the root of the application.
      onGenerateRoute: (RouteSettings routeSettings) =>
          NavigationSystem(
            initialRoute: const Page1(),
            routes: {
              /// Define the routes for the application using the `NavigationSystem`.
              Page1.routeName: (context, args) => const Page1(),
              Page2.routeName: (context, args) => const Page2(),
              Page3.routeName: (context, args) => const Page3(),
            },
          ).generateRoute(routeSettings),
    );
  }
}

/// The first page of the application.
class Page1 extends StatelessWidget {
  static const routeName = '/d1';
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Page 1'),
      ),
      body: const Center(
        child: Text('This is  Page 1 content.'),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'p1_f',
          onPressed: () {
            /// Navigate to Page2 when the floating action button is pressed.
            Go(context,routeName: Page2.routeName).to();
          },
          child: const Icon(Icons.arrow_forward_ios_rounded)),
    );
  }
}

/// The second page of the application.
class Page2 extends StatelessWidget {
  static const routeName = '/d2';
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Page 2'),
      ),
      body: const Center(
        child: Text('This is  Page 2 content.'),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'p2_b',
            onPressed: () {
              /// Pop the current page to return to the previous page.
              Go(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              heroTag: 'p2_f',
              onPressed: () {
                /// Navigate to Page3 when the second floating action button is pressed.
                Go(context,routeName: Page3.routeName).to();
              },
              child: const Icon(Icons.arrow_forward_ios_rounded)),
        ],
      ),
    );
  }
}

/// The third page of the application.
class Page3 extends StatelessWidget {
  static const routeName = '/d3';
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Page 3'),
      ),
      body: const Center(
        child: Text('This is  Page 3 content.'),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'p3_b',
        onPressed: () {
          /// Pop the current page to return to the previous page.
          Go(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
