import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/product_repository.dart';

class FunctionProvider extends ChangeNotifier{

  void addProductToCart (String name, double cost, String url, BuildContext context) {
    ProductRepository.productModelList.add(ProductModel(name: name, cost: cost, imageUrl: url));
    Navigator.of(context).pushReplacementNamed('/cart');
    notifyListeners();
  }



}