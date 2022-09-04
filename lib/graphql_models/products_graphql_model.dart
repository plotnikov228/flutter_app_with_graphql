import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductsGraphQLModel{
  final Widget? child;

  ProductsGraphQLModel({this.child});

  final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");

  late ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(link: httpLink, cache: GraphQLCache(store: InMemoryStore())),
  );

  late GraphQLProvider app = GraphQLProvider(
    child: child,
    client: client,
  );
}

const productsGraphQL = """
query products {
  products(first: 8, channel: "default-channel") {
      edges {
        node {
          id
          name
          description
          thumbnail{
            url
          }
        }
      }
    }
  }
""";
