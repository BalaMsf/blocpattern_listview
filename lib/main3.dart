import 'package:flutter/material.dart';

import 'homepage.dart';

class BlockMainpage extends StatelessWidget {
  final String Userdata;

  final String password;

  BlockMainpage({required this.Userdata, required this.password});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlockHomePage(
        title: 'Flutter Demo Home Page',
        Username: Userdata,
        Password: password,
      ),
    );
  }
}
