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

  Future<ProductPageResponse> getProductList(int page) async {
    String url = '/product/search/?page=$page';

    var jsonResponse = await server.get(url);
    ProductPageResponse pagedProducts =
        ProductPageResponse.fromJson(jsonDecode(jsonResponse));

    return pagedProducts;
  }
}



// @singleton
// class ProductRepository {
//   final httpClient = http.Client();
//   final String _baseUrl = 'http://localhost:8080'; // Replace with your URL

//   Future<List<Product>> fetchProducts([int startIndex = 0]) async {
//     final response = await httpClient.get(
//       Uri.https(
//         _baseUrl,
//         '/product/search',
//         <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
//       ),
//     );
//     if (response.statusCode == 200) {
//       final body = json.decode(response.body) as List;
//       return List<Product>.from(
//         body.map((p) => Product.fromJson(p)),
//       );
//     }
//     throw Exception('Error fetching posts');
//   }
// }