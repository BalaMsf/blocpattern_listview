import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/pets_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

class ProviderList extends StatelessWidget {
  const ProviderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetsProvider(),
      child: MaterialApp(
        title: 'Provider List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
