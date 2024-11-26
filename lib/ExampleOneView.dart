import 'package:flutter/material.dart';

class Exampleoneview extends StatefulWidget {
  const Exampleoneview({super.key});

  @override
  State<Exampleoneview> createState() => _ExampleoneviewState();
}

class _ExampleoneviewState extends State<Exampleoneview> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Provider"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Slider(value: value, onChanged: (val) {}),
          Container(
           
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: Text(
                      "Container 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    child: Text(
                      "Container 2",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
