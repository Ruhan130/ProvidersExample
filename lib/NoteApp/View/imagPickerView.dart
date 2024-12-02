import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagpickerview extends StatefulWidget {
  const Imagpickerview({super.key});

  @override
  State<Imagpickerview> createState() => _ImagpickerviewState();
}

class _ImagpickerviewState extends State<Imagpickerview> {
  File? image ;
  final picker = ImagePicker();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}