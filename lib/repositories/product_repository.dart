import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../models/product_page_response.dart';
import '../rest/rest_client.dart';

const _postLimit = 20;

@singleton
class ProductRepository {
  late RestAuthenticatedClient server;
  ProductRepository() {
    server = GetIt.I.get<RestAuthenticatedClient>();
  }

  Future<ProductPageResponse> getProductList(int page,
      {bool isFavorites = false}) async {
    String url =
        isFavorites ? '/favorites/?page=$page' : '/product/search/?page=$page';

    var jsonResponse = await server.get(url);
    ProductPageResponse pagedProducts =
        ProductPageResponse.fromJson(jsonDecode(jsonResponse));

    return pagedProducts;
  }
}
