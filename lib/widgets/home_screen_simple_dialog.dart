import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../models/product_repository.dart';
import '../provider_models/function_provider.dart';
import '../provider_models/price_model.dart';
import '../screens/cart_screen.dart';

Widget dialogForHomeScreen(
    BuildContext context, QueryResult result, int index) {
  context.read<PriceModel>().openSP();
  return SimpleDialog(
    contentPadding: EdgeInsets.zero,
    children: [
      SizedBox(
        height: 400,
        width: 400,
        child: Image.network(
            result.data?['products']['edges'][index]['node']['thumbnail']
                ['url'],
            fit: BoxFit.fill),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          result.data?['products']['edges'][index]['node']['name'],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      const Text('Select type:'),
      SizedBox(
          height: 100,
          width: 80,
          child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: context.watch<PriceModel>().price.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: OutlinedButton(
                      onPressed: () {
                        Provider.of<PriceModel>(context, listen: false)
                            .changeSP(index);
                      },
                      child: Text(
                          '${context.watch<PriceModel>().type[index]} ${context.watch<PriceModel>().price[index]}\$'),
                    ),
                  );
                },
              ))),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<PriceModel>(context, listen: false)
                        .closeSP(context);
                    ProductRepository.productModelList.add(ProductModel(
                      name: result.data?['products']['edges'][index]['node']
                          ['name'],
                      cost: Provider.of<PriceModel>(context, listen: false)
                          .selectedPrice,
                      imageUrl: result.data?['products']['edges'][index]['node']
                          ['thumbnail']['url'],
                    ));
                    sum = sum + Provider.of<PriceModel>(context, listen: false)
                        .selectedPrice;
                    Navigator.of(context).pushReplacementNamed('/cart');
                  },
                  child: Text(
                      'Add ${context.watch<PriceModel>().selectedProduct} to cart')),
              const SizedBox(
                width: 60,
              ),
              OutlinedButton(
                  onPressed: () {
                    context.read<PriceModel>().closeSP(context);
                  },
                  child: const Text('Cancel'))
            ],
          ),
        ),
      )
    ],
  );
}
