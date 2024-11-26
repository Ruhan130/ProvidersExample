import 'package:flutter/material.dart';
import 'package:project/provider/CountProvider.dart';
import 'package:provider/provider.dart';

class Countproviderexample extends StatefulWidget {
  const Countproviderexample({super.key});

  @override
  State<Countproviderexample> createState() => _CountproviderexampleState();
}

class _CountproviderexampleState extends State<Countproviderexample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<Countprovider>(context, listen: false);
    print("Initial");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text("Provider"),
        ),
        body:
        Center(
          child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        countProvider.addCount();
                      },
                      icon: const Icon(
                        Icons.arrow_circle_up,
                        size: 30,
                        color: Colors.brown,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Consumer<Countprovider>(builder: (context, value, child) {
                    return Text (value.count.toString(),style: const TextStyle(color: Colors.indigo,fontSize: 50),);
                  },),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        countProvider.subCount();
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        size: 30,
                        color: Colors.brown,
                      )),
                ],
              ),),);
            
         
       
        // Center(
        //   child: Consumer<Countprovider>(
        //     builder: (context, value, child) {
        //       print("Consumer");
        //       return Text(
        //         value.count.toString(),
        //         style: TextStyle(fontSize: 40),
        //       );
        //     },
        //   ),
        // ),
    
  }

}