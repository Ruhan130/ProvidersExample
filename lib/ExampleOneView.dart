import 'package:flutter/material.dart';
import 'package:project/provider/ExampleOneProvider.dart';
import 'package:provider/provider.dart';

class Exampleoneview extends StatefulWidget {
  const Exampleoneview({super.key});

  @override
  State<Exampleoneview> createState() => _ExampleoneviewState();
}

class _ExampleoneviewState extends State<Exampleoneview> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Exampleoneprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Exampleoneprovider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<Exampleoneprovider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color:
                            Colors.blueGrey.withOpacity(value.value),
                      ),
                      child: const Text(
                        "Container 1",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(value.value),
                      ),
                      child: const Text(
                        "Container 2",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
