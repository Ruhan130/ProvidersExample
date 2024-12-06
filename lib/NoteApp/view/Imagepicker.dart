import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Imagpickerview extends StatefulWidget {
  const Imagpickerview({super.key});

  @override
  State<Imagpickerview> createState() => _ImagpickerviewState();
}

class _ImagpickerviewState extends State<Imagpickerview> {
  Uint8List? image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Stack(
          children: [
            // Display user-selected image or default avatar
            CircleAvatar(
              radius: 100,
              backgroundImage: image != null
                  ? MemoryImage(image!)
                  : const NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                    ) as ImageProvider,
            ),
            // Add image button
            Positioned(
              bottom: 0,
              left: 160,
              child: IconButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> statues =
                      await [Permission.storage, Permission.camera].request();
                  if (statues[Permission.storage]!.isGranted &&
                      statues[Permission.camera]!.isGranted) {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context); // Close modal
                                    await _imgFromCamera();
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        size: 70,
                                      ),
                                      Text("Camera"),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.pop(context); // Close modal
                                    await _imgFromGallery();
                                  },
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.photo_library,
                                        size: 70,
                                      ),
                                      Text("Gallery"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    print("Permissions not granted.");
                  }
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _imgFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path).readAsBytesSync();
      });
    }
  }

  Future<void> _imgFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path).readAsBytesSync();
      });
    }
  }
}