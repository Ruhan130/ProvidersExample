import 'dart:async';

import 'package:flutter/material.dart';

class Providermanagement extends StatefulWidget {
  const Providermanagement({super.key});

  @override
  State<Providermanagement> createState() => _ProvidermanagementState();
}

class _ProvidermanagementState extends State<Providermanagement> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        count++;
        print(count);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(count.toString(),style: const TextStyle(fontSize: 40),),
          ),
        ],
      ),
    );
  }
}
