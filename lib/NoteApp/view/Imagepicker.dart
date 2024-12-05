import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/NoteApp/provider/imageProvider.dart';
import 'package:provider/provider.dart';

class Imagpickerview extends StatefulWidget {
  const Imagpickerview({super.key});

  @override
  State<Imagpickerview> createState() => _ImagpickerviewState();
}

class _ImagpickerviewState extends State<Imagpickerview> {
  Uint8List? image;
  File? imageFile;

  // File? image;
  // File? imageFile;
  // final picker = ImagePicker();

  // Future getImageGallery() async {
  //   final pickerImage =
  //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
  //   setState(() {
  //     if (pickerImage != null) {
  //       image = File(pickerImage.path);
  //     } else {
  //       print("No Image picked");
  //     }
  //   });
  // }

  // Future getImageFromCamera() async {
  //   final pickerImage =
  //       await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
  //   setState(() {
  //     if (pickerImage != null) {
  //       image = File(pickerImage.path);
  //     } else {
  //       print("No Image picked");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: ChangeNotifierProvider<Imageprovider>(
        create: (context) => Imageprovider(),
        child: Consumer<Imageprovider>(builder: (context, viewModel, child) {
          return Center(
            child: Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 100,
                        backgroundImage: MemoryImage(image!),
                      )
                    : const CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                      ),
                Positioned(
                  bottom: -0,
                  left: 140,
                  child: IconButton(
                    onPressed: () {
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
                                    var returnIamge = await ImagePicker().pickImage(source: ImageSource.camera);
                                    if(returnIamge == null ) return;
                                    viewModel.setImage(File(returnIamge.path));
                                    },
                                    child: const SizedBox(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.image,
                                            size: 70,
                                          ),
                                          Text("Camera"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      var returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                                      if(returnImage == null) return ;
                                      viewModel.setImage(File(returnImage.path));
                                    },
                                    child: const SizedBox(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.photo_size_select_large,
                                            size: 70,
                                          ),
                                          Text("Gallery"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );

    // Scaffold(
    //   body: Center(
    //     child: Column(
    //       children: [
    //         InkWell(
    //           onTap: getImageGallery,
    //           child: Container(
    //             height: 300,
    //             width: 300,
    //             decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    //             child: image != null
    //                 ? Image.file(image!.absolute)
    //                 : const Center(
    //                     child: Icon(Icons.add_photo_alternate,size: 30,),
    //                   ),
    //           ),
    //         ),
    //         InkWell(
    //           onTap: getImageFromCamera,
    //           child: Container(
    //             height: 300,
    //             width: 300,
    //             decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    //             child: image != null
    //                 ? Image.file(image!.absolute)
    //                 : const Center(
    //                     child: Text("From Camera"),
    //                   ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  void showImagePickerOption(BuildContext, context) {}

// THIS FUNCTION FOR PIC IMAGE FROM GALLERY
  Future pickImageFromgallery() async {
    final returnImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (returnImage == null) return;
    setState(() {
      imageFile = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();
      Navigator.pop(context);
    });
  }

  //  THIS FUNCTION FOR PIC IMAGE FROM CAMMERA
  Future pickImageFromCamera() async {
    final returnImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 80);
    if (returnImage == null) return;
    setState(() {
      imageFile = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();
      Navigator.pop(context);
    });
  }
}
