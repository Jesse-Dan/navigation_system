
# navigation_system - 0.0.5v

A Flutter plugin providing a set of navigation utilities for managing routes and the navigation stack in a Flutter application.

## Features

- **Navigate to specified routes with optional arguments.**
- **Clear all previous routes from the stack.**
- **Replace the current route with a named route.**
- **Pop until a specific route is reached.**
- **Navigate back to the previous screen with provided data.**
- **And more!**

## Usage

This plugin offers a utility class `Go<T>` that simplifies navigation in a Flutter app. It provides methods for navigating to specific routes, managing route stack, and passing data between screens.

Here's an overview of some key methods available in the `Go<T>` class:

### `toAndExpectData<T>()`

Navigates to a named route and expects to receive data back. It waits for the specified route to return data and returns the result obtained from the navigated route.

```dart
Future<T?> toAndExpectData<T>() async {
  // Implementation...
}
backWithData<T>()
Navigates back to the previous screen with provided data. It pops the current route and returns the specified data to the previous screen.

dart
void backWithData(T data) {
  // Implementation...
}
toAndClearAll()
Navigates to the specified route and removes all other routes from the stack. It clears the navigation stack, making the specified route the only one in the stack.

dart
void toAndClearAll() {
  // Implementation...
}
replaceWithNamedRoute()
Replaces the current route with a named route. It replaces the current route with the specified named route.

dart
void replaceWithNamedRoute() {
  // Implementation...
}
popUntilNamedRoute()
Pops until a specific route is reached. It pops routes from the navigation stack until the specified named route is reached.

dart
void popUntilNamedRoute() {
  // Implementation...
}
These methods simplify navigation tasks and provide an easy way to manage route navigation in your Flutter app.

Getting Started
To use this navigation system in your Flutter app:

Add the navigation_system plugin to your pubspec.yaml file.
Import the package into your Dart code.
Create an instance of the Go<T> class and use its methods for navigation tasks.
For detailed implementation and usage instructions, refer to the code documentation and examples provided.

Platform Support
This plugin is available on Android, iOS, MacOS, and Windows.

For more detailed instructions on how to use and implement this plugin, refer to Flutter's documentation.

