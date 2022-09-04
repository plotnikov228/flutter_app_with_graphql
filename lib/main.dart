import 'package:flutter/material.dart';
import 'package:flutter_app_with_graphql/graphql_models/products_graphql_model.dart';
import 'package:flutter_app_with_graphql/models/button_color_model.dart';
import 'package:flutter_app_with_graphql/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'models/price_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PriceModel()),
      ChangeNotifierProvider(create: (_) => ButtonModel())
    ],
    child: const MyApp(),
  ));
}

Widget childWidget() {
  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProductsGraphQLModel productsModel =
        ProductsGraphQLModel(child: const HomeScreen());
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: productsModel.app,
    );
  }
}
