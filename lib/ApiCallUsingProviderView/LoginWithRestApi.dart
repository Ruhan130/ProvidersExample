// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

class Loginwithrestapi extends StatefulWidget {
  const Loginwithrestapi({super.key});

  @override
  State<Loginwithrestapi> createState() => _LoginwithrestapiState();
}

class _LoginwithrestapiState extends State<Loginwithrestapi> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
    final authProvider = Provider.of<Authprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 30,
            color: Colors.amberAccent,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: passController,
              decoration: const InputDecoration(hintText: "Passowrd"),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                authProvider.login(
                    emailController.toString(), passController.toString());
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(20)),
                child:  Center(
                  child: authProvider.loading ? const CircularProgressIndicator(color: Colors.white,) : const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
