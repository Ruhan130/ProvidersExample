import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class FormAndValidations extends StatefulWidget {
  const FormAndValidations({super.key});

  @override
  State<FormAndValidations> createState() => _FormAndValidationsState();
}

class _FormAndValidationsState extends State<FormAndValidations> {
  final _dronDownTextField = ["3-to-9", "9-to-16", "16-to25","25-to-50"];
  String? _showDropDownValue ;

  TextEditingController mobileNumber = TextEditingController();
  bool _issPas = false;
  bool _isSecured = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? gender; // Gender validation
  String? genderError; // Error message for gender
  bool checked = false;

  void _formValidate() {
    setState(() {
      genderError = null; // Reset error message before validation
    });

    if (_formKey.currentState!.validate() && gender != null) {
      print("Form is valid");
      print("Gender: $gender");
      print("Checked: $checked");
      // Proceed with form submission
    } else {
      if (gender == null) {
        setState(() {
          genderError = "Please select a gender"; // Set error message
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 205, 181, 249),
        title: const Text("Form And Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                    prefixIcon: Icon(Icons.person,color: Colors.deepPurple[400]),
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
                    prefixIcon:  Icon(Icons.email,color: Colors.deepPurple[400]),
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
                         prefixIcon:  Icon(Icons.password,color: Colors.deepPurple[400]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  obscureText: _isSecured,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _pasValidate,
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
                      prefixIcon:  Icon(Icons.password,color: Colors.deepPurple[400]),
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
                      prefixIcon:  Icon(Icons.phone_outlined,color: Colors.deepPurple[400],),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          genderError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                          CheckboxListTile(
                  title: const Text("Visible Selected"),
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = value!;
                    });
                  },
                ),
                checked == true
                    ? Center(
                      child: Text(
                          "$gender",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                    )
                    : Container(),
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
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.deepPurple[300],
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
                const SizedBox(
                  height: 140,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ElevatedButton(
                    onPressed: _formValidate,
                    child:  const Text("Submit",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
