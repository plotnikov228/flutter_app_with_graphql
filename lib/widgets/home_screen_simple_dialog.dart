import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_with_graphql/models/button_color_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../models/price_model.dart';

Widget dialogForHomeScreen(BuildContext context, QueryResult result,
    int index) {
  context.read<PriceModel>().openSP();
  context.read<ButtonModel>().openModel();
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
          style: Theme
              .of(context)
              .textTheme
              .headline6,
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
                        context.read<PriceModel>().changeSP(index);
                        context.read<ButtonModel>().changeModel();
                      },
                      child: Text(
                          '${context.watch<PriceModel>().type[index]} ${context.watch<PriceModel>().price[index]}\$'),
                      style: OutlinedButton.styleFrom(
                        primary: context.watch<ButtonModel>().borderColor,
                      ),
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
              FlatButton(onPressed: () {
                context.read<ButtonModel>().closeModel(context);
                context.read<PriceModel>().closeSP(context);
              },
                  color: context.watch<ButtonModel>().buttonColor,
                  child: Text('Add ${context.watch<PriceModel>().selectedProduct} to cart')
              ),
              const SizedBox(width: 60,),
              RaisedButton(onPressed: () {
                context.read<ButtonModel>().closeModel(context);
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
