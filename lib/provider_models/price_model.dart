import 'package:flutter/material.dart';

class PriceModel extends ChangeNotifier{
  List<String> type = <String>['cd', 'vinyl'];
  List<double> price = <double>[103.00, 120.00];
  late String selectedProduct ='${type[0]} ${price[0]}\$';
  late double selectedPrice = price[0];

  void openSP () {
    notifyListeners();
  }

  void changeSP (int index) {
    selectedProduct = '${type[index]} ${price[index]}\$';
    selectedPrice = price[index];
    notifyListeners();
  }

  void closeSP (BuildContext context) {
    selectedProduct = '${type[0]} ${price[0]}\$';
    double selectedPrice = price[0];
    Navigator.of(context).pop();
  }
}