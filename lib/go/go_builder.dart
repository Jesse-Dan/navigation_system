import 'package:flutter/material.dart';
import 'go_service.dart';

/// A class that helps in building and managing routes for a Flutter application.
class NavigationRouteBuilder {
  final Widget initialRoute;

  /// A map that associates route names with widget constructors.
  final Map<String, Widget Function(BuildContext, MyRouteArguments?)> routes;

  /// Creates a new instance of `NavigationRouteBuilder` to manage routes in the application.
  ///
  /// - `initialRoute`: The widget that represents the initial route of the application.
  /// - `routes`: A map that associates route names with corresponding widget constructors.
  ///
  /// Throws an exception if the `routes` map is empty.
  NavigationRouteBuilder({
    required this.initialRoute,
    required this.routes,
  }) {
    if (routes.isEmpty) {
      throw Exception('Routes map cannot be empty.');
    }
  }

  /// Generates a [MaterialPageRoute] for a given route based on the provided route settings.
  ///
  /// - `routeSettings`: The settings for the route to be generated.
  ///
  /// Returns a [MaterialPageRoute] for the specified route, including any associated arguments.
  /// If the route is not found in the `routes` map, it will use the `initialRoute` as the default route.
  /// If the route is not found and no `initialRoute` is provided, it will return an error page.
  MaterialPageRoute<void> generateRoute(RouteSettings routeSettings) {
    final routeBuilder = routes[routeSettings.name];

    if (routeBuilder != null) {
      MyRouteArguments? args = routeSettings.arguments == null
          ? null
          : MyRouteArguments(
              arguments: routeSettings.arguments as List<Map<String, dynamic>>,
            );
      return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (context) => routeBuilder(context, args),
      );
    }

    // If the route is not found, you can return a default route or an error page.
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (context) => initialRoute, /// Default route
    );
  }
}
