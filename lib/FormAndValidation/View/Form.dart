import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FormAndValidations extends StatefulWidget {
  const FormAndValidations({super.key});

  @override
  State<FormAndValidations> createState() => _FormAndValidationsState();
}

class _FormAndValidationsState extends State<FormAndValidations> {
  final _dronDownTextField = ["3-to-9", "9-to-16", "16-to25", "25-to-50"];
  String? _showDropDownValue;

  TextEditingController mobileNumber = TextEditingController();
  bool _issPas = true;
  bool _isSecured = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? gender; // Gender validation
  String? genderError; // Error message for gender
  String? checkboxError;
  bool checked = false;
  String? dropDownError;

  //  IMAGE PICKER FROM GALLERY
  Uint8List? image;
  final picker = ImagePicker();
  String? imageError;

  void _formValidate() {
    setState(() {
      genderError = null; // Reset error message before validation
      checkboxError = null;
      dropDownError = null;
      imageError = null;
    });

    if (_formKey.currentState!.validate() &&
        gender != null &&
        checked &&
        _showDropDownValue != null &&
        image != null) {
      print("Form is valid");
      print("Gender: $gender");
      print("Checked: $checked");
      print("Checked: $_showDropDownValue");
      print("Image: $image");
      // Proceed with form submission
    } else {
      if (gender == null) {
        setState(() {
          genderError = "Please select a gender"; // Set error message
        });
      }
      if (!checked) {
        setState(() {
          checkboxError = "You must accept the terms"; // Set checkbox error
        });
      }
      if (_showDropDownValue == null) {
        setState(() {
          dropDownError =
              "Please select an option from dropdown"; // Set dropdown error
        });
      }
      if (image == null) {
        setState(() {
          imageError = 'Please Select Image';
        });
      }
    }
  }

  String? _checkEmail(value) {
    if (value!.isEmpty) {
      return 'Please Enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _phoneValidate(value) {
    if (value!.isEmpty) {
      return 'Please Enter your Phone Number';
    }
    if (mobileNumber.text.length != 11) {
      return 'Please Enter 11 digit Numbers only';
    }
    return null;
  }

  String? _pasValidate(value) {
    if (value!.isEmpty) {
      return 'Please Enter Password';
    }
    if (value.length <= 5) {
      return 'Password must be greater than 5 characters';
    }
    return null;
  }
    String? _pasConformValidate(value) {
    if (value!.isEmpty) {
      return 'Please Enter Same Password';
    }
    if (value.length <= 5) {
      return 'Please Enter Same Password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 60, 69),
        title: const Text("Form And Validation",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    prefixIcon:
                        Icon(Icons.person, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _checkEmail,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    prefixIcon:
                        Icon(Icons.email, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  obscureText: _issPas,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _pasValidate,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _issPas = !_issPas;
                          });
                        },
                        icon: _issPas
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintText: "Enter Your Password",
                    prefixIcon:
                        Icon(Icons.password, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  obscureText: _isSecured,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _pasConformValidate,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSecured = !_isSecured;
                          });
                        },
                        icon: _isSecured
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintText: "Confirm Password",
                    prefixIcon:
                        Icon(Icons.password, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: mobileNumber,
                  keyboardType: TextInputType.number,
                  validator: _phoneValidate,
                  decoration: InputDecoration(
                    hintText: "Enter Your Phone Number",
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioListTile(
                          title: const Text("Male"),
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                              genderError = null; // Clear error on selection
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text("Female"),
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                              genderError = null; // Clear error on selection
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text("Other"),
                          value: 'Other',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                              genderError = null; // Clear error on selection
                            });
                          },
                        ),
                        if (genderError != null)
                          Text(
                            genderError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  checked = value!;
                                  checkboxError =
                                      null; // Clear error on selection
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              "Terms And Conditions",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        if (checkboxError != null)
                          Text(
                            checkboxError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                      value: _showDropDownValue,
                      items: _dronDownTextField
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _showDropDownValue = value as String;
                          dropDownError = null;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.deepPurple[100],
                      decoration: const InputDecoration(
                        labelText: 'Pick an Age',
                        hintText: 'Insert Age',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    if (dropDownError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          dropDownError!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(
                      height: 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          // Display user-selected image or default avatar
                          CircleAvatar(
                            radius: 80,
                             // Reduced radius for smaller height
                            backgroundImage: image != null
                                ? MemoryImage(image!)
                                : const NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                  ) as ImageProvider,
                          ),
                          // Add image button
                          Positioned(
                            bottom:
                                5, // Adjusted position closer to CircleAvatar
                            left: 120, // Adjusted for new CircleAvatar size
                            child: IconButton(
                              onPressed: () async {
                                Map<Permission, PermissionStatus> statues =
                                    await [
                                  Permission.storage,
                                  Permission.camera
                                ].request();
                                if (statues[Permission.storage]!.isGranted &&
                                    statues[Permission.camera]!.isGranted) {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (builder) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  Navigator.pop(
                                                      context); // Close modal
                                                  await _imgFromCamera();
                                                },
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                  Navigator.pop(
                                                      context); // Close modal
                                                  await _imgFromGallery();
                                                },
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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

                    //  VALIDATION IMAGE IMAGE IS NOT SELECTED
                    if (imageError != null)
                      Text(
                        imageError!,
                        style: const TextStyle(color: Colors.red),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Expanded(
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: TextButton(
            onPressed: _formValidate,
            child: const Text(
              "SUBMIT",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
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
