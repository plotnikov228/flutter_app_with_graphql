import 'package:flutter/material.dart';

class ButtonModel extends ChangeNotifier{
  Color borderColor = Colors.black54;
  Color buttonColor = Colors.white;

  void openModel () {
    notifyListeners();
  }

  void changeModel() {
    buttonColor = Colors.lightBlueAccent;
    notifyListeners();
  }

  void closeModel(BuildContext context) {
    buttonColor = Colors.white;
  }
}