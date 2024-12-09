import 'package:flutter/material.dart';

class FormAndValidations extends StatefulWidget {
  const FormAndValidations({super.key});

  @override
  State<FormAndValidations> createState() => _FormAndValidationsState();
}

class _FormAndValidationsState extends State<FormAndValidations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text("Form And Validation"),
      ),
    );
  }
}