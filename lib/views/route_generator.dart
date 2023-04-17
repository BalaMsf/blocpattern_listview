import 'package:flutter/material.dart';

import '../main3.dart';

class RouteGenerator {
  //Settings is the object received in the onGenerateRoute
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlockMainpage(
              Userdata: args,
              password: args,
            ),
          );
        }
        return _errorRoute();

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
