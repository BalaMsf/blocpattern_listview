import 'package:flutter/material.dart';

class RouteGenerator {
  //Settings is the object received in the onGenerateRoute
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      /*  case '/third':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => HomePage(),
          );
        }
        return _errorRoute();*/

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
