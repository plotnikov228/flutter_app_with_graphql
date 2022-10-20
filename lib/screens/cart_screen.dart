import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/product_repository.dart';

double sum = 0;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(ProductRepository.productModelList.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          title: const Text('CART', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: const Center(child: Text("Здесь пусто"),));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
        title: const Text('CART', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            height: 200.0,
            child: ListView.builder(
                itemCount: ProductRepository.productModelList.length,
                itemBuilder: (BuildContext context, int index) {

                  ProductModel product =
                      ProductRepository.productModelList[index];
                  return Card(
                    key: Key(index.toString()),
                    child: Column(
                      children: [
                        Image.network(product.imageUrl, fit: BoxFit.fill),
                        Text(product.name),
                        Text('${product.cost.toString()}\$')
                      ],
                    ),
                  );
                }),
          )),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Сумма заказа"),
                          Text("${sum.toString()}\$"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ProductRepository.productModelList.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                          minimumSize: const Size(250, 60)),
                      onPressed:
                          ProductRepository.productModelList.isEmpty ? null : () {},
                      child: Text(
                        "Оформить",
                        style: TextStyle(
                            color: ProductRepository.productModelList.isEmpty
                                ? Colors.grey.withOpacity(0.7)
                                : Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

