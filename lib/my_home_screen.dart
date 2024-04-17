import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class myHomeScreen extends StatefulWidget {
  const myHomeScreen({super.key});

  @override
  State<myHomeScreen> createState() => _myHomeScreenState();
}

class _myHomeScreenState extends State<myHomeScreen> {
  // final _formKey = GlobalKey<FormState>();
  final _signUpKey = GlobalKey<FormState>();
  final _signUpKey2 = GlobalKey<FormState>();

  final Map<String, TextEditingController> sigUpController = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _signUpKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 10,
                    controller: sigUpController['firstName'],
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.abc,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      ),
                    ],
                  ),
                  // define the other TextFormField here
                  TextButton(
                    onPressed: () {
                      if (!_signUpKey.currentState!.validate()) {
                        return;
                      }

                      // To get data I wrote an extension method bellow
                      final data = sigUpController.data();

                      print(data[
                          'firstName']); // data: {firstName: John, lastName: Doe, email: example@email.com, phone: 0000000000, password: password}
                    },
                    child: const Text('submit'),
                  )
                ],
              ),
            ),
            Form(
              key: _signUpKey2,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 10,
                    controller: sigUpController['lastName'],
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.abc,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      ),
                    ],
                  ),
                  // define the other TextFormField here
                  TextButton(
                    onPressed: () {
                      if (!_signUpKey2.currentState!.validate()) {
                        return;
                      }

                      // To get data I wrote an extension method bellow
                      final data = sigUpController.data();

                      print(data[
                          'lastName']); // data: {firstName: John, lastName: Doe, email: example@email.com, phone: 0000000000, password: password}
                    },
                    child: const Text('submit'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

extension Data on Map<String, TextEditingController> {
  Map<String, dynamic> data() {
    final res = <String, dynamic>{};
    for (MapEntry e in entries) {
      res.putIfAbsent(e.key, () => e.value?.text);
    }
    return res;
  }
}
