import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickImage != null) {
        image = File(pickImage.path);
      } else {
        print("No Image Picked ");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            getImage();
          },
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: image != null
                ? Image.file(
                    image!.absolute,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 30,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
