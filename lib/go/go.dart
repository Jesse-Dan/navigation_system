import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'go_service.dart';

/// A utility class for simplifying navigation in a Flutter app.
class Go {
  final String? routeName;
  final MyRouteArguments? arguments;
  final BuildContext context;
  final dynamic data;

  /// Creates a [Go] instance with the provided parameters.
  ///
  /// - `context`: The BuildContext from which navigation actions will be performed.
  /// - `routeName`: The name of the route to navigate to.
  /// - `data`: Navigates back to the previous screen with provided data.
  /// - `arguments`: Optional route-specific data to pass when navigating.
  Go(this.context, {this.routeName, this.arguments, this.data});

  /// Sets up a tap gesture recognizer for the [onTapRecognizeGesture] method.
  ///
  /// This method creates a tap gesture recognizer and attaches an onTap action to it.
  /// When the gesture is recognized, it navigates to the specified route with optional arguments.
  TapGestureRecognizer onTapRecognizeGesture() {
    void onTap() {
      if (routeName != null) {
        // Navigates to the specified route with optional arguments.
        Navigator.of(context)
            .pushNamed(routeName!, arguments: arguments?.arguments);
      }
    }

    // Attach the onTap action to the recognizer.
// Create a TapGestureRecognizer and attach the onTap action to it.
    TapGestureRecognizer gestureRecognizer = TapGestureRecognizer()
      ..onTap = onTap;

    return gestureRecognizer;
  }

  /// Pops the current route from the navigation stack.
  ///
  /// If a valid context is provided, this method removes the current route from the stack.
  void pop() {
    Navigator.pop(context);
  }

  /// Navigates to the specified route with optional arguments.
  ///
  /// If a valid context and route name are provided, this method navigates to the specified route with optional arguments.
  void to() {
    if (routeName != null) {
      Navigator.pushNamed(context, routeName!, arguments: arguments?.arguments);
    }
  }

  /// Navigates to the specified route and removes all other routes from the stack.
  ///
  /// If a valid [BuildContext] and [routeName] are provided, this method navigates to the specified route
  /// and clears all other routes from the stack, making it the only route in the navigation stack.

  void toAndClearAll() {
    if (routeName != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(routeName!, (_) => false,
          arguments: arguments?.arguments);
    }
  }

  /// Navigates to a named route with specified arguments.
  ///
  /// If a valid [BuildContext] is provided, this method navigates to the specified route with optional arguments.
  void toNamedRouteWithArgs() {
    Navigator.pushNamed(
      context,
      routeName!,
      arguments: arguments,
    );
  }

  /// Navigates back to the previous screen with provided data.
  ///
  /// If a valid [BuildContext] is provided, this method navigates back to the previous screen and passes the provided data.
  void backWithData() {
    Navigator.pop(context, data);
  }

  /// Replaces the current route with a named route.
  ///
  /// If a valid [BuildContext] is provided, this method replaces the current route with the specified named route.
  void replaceWithNamedRoute() {
    Navigator.pushReplacementNamed(context, routeName!);
  }

  /// Replaces the current route with a named route and optional arguments.
  ///
  /// If a valid [BuildContext] is provided, this method replaces the current route with the specified named route
  /// and passes optional route-specific arguments.
  void replaceWithNamedRouteWithArgs() {
    Navigator.pushReplacementNamed(
      context,
      routeName!,
      arguments: arguments,
    );
  }

  /// Navigates to a new route and removes all previous routes from stack.
  ///
  /// If a valid [BuildContext] is provided, this method navigates to the specified named route
  /// and removes all previous routes from the navigation stack.
  void toAndClearAllNamedRoute() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName!,
      (route) => true,
    );
  }

  /// Pops until a specific route is reached.
  ///
  /// If a valid [BuildContext] is provided, this method pops routes from the navigation stack
  /// until the specified named route is reached.
  void popUntilNamedRoute() {
    Navigator.popUntil(
      context,
      ModalRoute.withName(routeName!),
    );
  }

  /// Navigates to a new route, replacing all previous routes in stack.
  ///
  /// If a valid [BuildContext] is provided, this method navigates to the specified named route,
  /// replacing all previous routes in the navigation stack.
  void toAndReplaceAllNamedRoute() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName!,
      (route) => false,
    );
  }

  /// Navigates to a new route, clearing all previous routes in stack.
  ///
  /// If a valid [BuildContext] is provided, this method navigates to the specified named route,
  /// clearing all previous routes in the navigation stack.
  void toAndClearAllReplacementNamedRoute() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName!,
      (route) => true,
    );
  }
}
