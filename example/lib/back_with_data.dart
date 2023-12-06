import 'package:flutter/material.dart';
import 'package:navigation_system/go/go.dart';
import 'package:navigation_system/navigation_system.dart';

void main() {
  runApp(BackWithData());
}

class BackWithData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings) => NavigationSystem(
        initialRoute: FirstScreen(),
        routes: {
          /// Define the routes for the application using the `NavigationSystem`.
          FirstScreen.routeName: (context, args) => FirstScreen(),
          SecondScreen.routeName: (context, args) => SecondScreen(),
        },
      ).generateRoute(routeSettings),
    );
  }
}

class FirstScreen extends StatelessWidget {
  static const routeName = '/f';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result =
                await Go<bool>(context, routeName: SecondScreen.routeName)
                    .toAndExpectData();
            print('Received result from SecondScreen now: $result');
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  static const routeName = '/s';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Go<bool>(
              context,
            ).backWithData(false);
          },
          child: const Text('Return Data'),
        ),
      ),
    );
  }
}
