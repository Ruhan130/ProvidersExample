import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalenderApp extends StatefulWidget {
  const CalenderApp({super.key});

  @override
  State<CalenderApp> createState() => _CalenderAppState();
}

class _CalenderAppState extends State<CalenderApp> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Calender App"),);
  }
}