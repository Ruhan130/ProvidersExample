import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagpickerview extends StatefulWidget {
  const Imagpickerview({super.key});

  @override
  State<Imagpickerview> createState() => _ImagpickerviewState();
}

class _ImagpickerviewState extends State<Imagpickerview> {
  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickerImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
        setState(() {
          if(pickerImage != null){
            image = File(pickerImage.path);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
