import 'package:flutter/material.dart';
import 'package:flutter_app_with_graphql/graphql_models/products_graphql_model.dart';
import 'package:flutter_app_with_graphql/widgets/home_screen_simple_dialog.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../models/product_repository.dart';
import '../provider_models/function_provider.dart';
import '../widgets/cart_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SALEOR.IO',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 10),
          child:
          cartIcon(ProductRepository.productModelList, context)
          )
        ],
      ),
      body: Query(
        options: QueryOptions(document: gql(productsGraphQL)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator( color: Colors.black,),
            );
          }

          final productList = result.data?['products']['edges'];

          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 0.75
              ),
              itemCount: productList.length,
              itemBuilder: (_, index) {
                var product = productList[index]["node"];

                return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              dialogForHomeScreen(context, result, index));
                    },
                    child: Column(
                      children: [
                        Image.network(product['thumbnail']['url']),
                        Text(product['name']),

                      ],
                    ));
              });
        },
      ),
    );
  }
}
