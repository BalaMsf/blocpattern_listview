import 'package:flutter/material.dart';

import '../main1.dart';

class UserFromScreen extends StatefulWidget {
  const UserFromScreen({Key? key}) : super(key: key);

  @override
  State<UserFromScreen> createState() => _UserFromScreenState();
}

class _UserFromScreenState extends State<UserFromScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User form Entry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                // maxLength: 10,
                controller: userName,
                decoration: InputDecoration(
                  hintText: "Enter User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter User Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user Password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("===>Validated");
                    Navigator.of(context)
                        .pushNamed('/second', arguments: userName.text);
                    /*   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlockMainpage()));*/
                    print(
                        "User Name ${userName.text}, Password ${password.text}");
                    Map userRequiredData = {
                      "user_name": userName.text,
                      "password": password.text
                    };
                    print(userRequiredData);
                  } else {
                    print("===>Not Validated");
                  }
                },
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProviderList()));
                },
                child: const Text('View Provider listdata '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
