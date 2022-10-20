import 'package:flutter/material.dart';

Widget cartIcon(List list, BuildContext context) {
  return Container(
    width: 60,
    height: 60,
    child: Stack(children: [
      IconButton(
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/cart');
        },
      ),
      Visibility(
          visible: list.isNotEmpty,
          child: Align(
              alignment: const AlignmentDirectional(0.1, -0.75),
              child: Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  list.length.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              )))
    ]),
  );
}