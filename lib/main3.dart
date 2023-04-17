import 'package:flutter/material.dart';

import 'homepage.dart';

class BlockMainpage extends StatelessWidget {
  const BlockMainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlockHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
