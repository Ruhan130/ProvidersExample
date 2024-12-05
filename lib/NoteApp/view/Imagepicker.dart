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
  File? imageFile;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickerImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickerImage != null) {
        image = File(pickerImage.path);
      } else {
        print("No Image picked");
      }
    });
  }

  Future getImageFromCamera() async {
    final pickerImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickerImage != null) {
        image = File(pickerImage.path);
      } else {
        print("No Image picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: getImageGallery,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: image != null
                    ? Image.file(image!.absolute)
                    : const Center(
                        child: Icon(Icons.add_photo_alternate,size: 30,),
                      ),
              ),
            ),
            InkWell(
              onTap: getImageFromCamera,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: image != null
                    ? Image.file(image!.absolute)
                    : const Center(
                        child: Text("From Camera"),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
