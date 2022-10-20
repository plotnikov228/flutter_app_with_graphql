import 'package:flutter/material.dart';
import 'package:flutter_app_with_graphql/graphql_models/products_graphql_model.dart';
import 'package:flutter_app_with_graphql/provider_models/function_provider.dart';
import 'package:flutter_app_with_graphql/provider_models/price_model.dart';
import 'package:flutter_app_with_graphql/screens/cart_screen.dart';
import 'package:flutter_app_with_graphql/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PriceModel()),
      ChangeNotifierProvider(create: (_) => FunctionProvider())
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
      routes: {
        '/home': (context) => productsModel.app,
        '/cart': (context) => ProductsGraphQLModel(child: const CartScreen()).app
      }
    );
  }
}
