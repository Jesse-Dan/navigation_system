import 'dart:convert';

/// A class to encapsulate arguments for a route.
class MyRouteArguments {
  final List<Map<String, dynamic>> arguments;

  /// Creates [MyRouteArguments] with the provided arguments.
  ///
  /// - `arguments`: A list of key-value pairs representing route-specific data.
  MyRouteArguments({required this.arguments});

  /// Converts the arguments to a map.
  Map<String, dynamic> toMap() {
    return {
      'arguments': arguments,
    };
  }

  /// Creates [MyRouteArguments] from a map of arguments.
  ///
  /// - `map`: A map representing route-specific data.
  factory MyRouteArguments.fromMap(Map<String, dynamic> map) {
    return MyRouteArguments(
      arguments: List<Map<String, dynamic>>.from(
          map['arguments'] as List<Map<String, dynamic>>),
    );
  }

  /// Converts the arguments to a JSON string.
  ///
  /// Returns a JSON-encoded string representation of the route arguments.
  String toJson() => json.encode(toMap());

  /// Creates [MyRouteArguments] from a JSON string.
  ///
  /// - `source`: A JSON-encoded string representing route-specific data.
  factory MyRouteArguments.fromJson(String source) {
    return MyRouteArguments.fromMap(
        json.decode(source) as Map<String, dynamic>);
  }
}
