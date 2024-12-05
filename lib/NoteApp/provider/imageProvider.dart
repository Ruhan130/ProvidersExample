import 'package:flutter/material.dart';

class Imageprovider extends ChangeNotifier {
  var image;
  Future setImage(var file) async {
    this.image = file;
    notifyListeners();
  }
}
