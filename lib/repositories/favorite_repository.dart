// import 'dart:async';

// import 'package:get_it/get_it.dart';
// import 'dart:convert';

// import 'package:injectable/injectable.dart';

// import '../models/favorites.dart';
// import '../rest/rest_client.dart';

// class FavoriteRepository {
//   late RestClient server;

//   late StreamController<List<Favorites>> _favoritesController;
//   Stream<List<Favorites>> get favoritesStream => _favoritesController.stream;

//   FavoriteRepository() {
//     server = GetIt.I.get<RestClient>();

//     _favoritesController = StreamController<List<Favorites>>();
//     fetchFavorites();
//   }

//   Future<List<Favorites>> fetchFavorites() async {
//     try {
//       final response = await server.get("/favorites");
//       final favorites = (json.decode(response) as List)
//           .map((item) => Favorites.fromJson(item))
//           .toList();
//       _favoritesController.add(favorites);
//       return favorites;
//     } catch (error) {
//       print('Error fetching favorites: $error');
//       rethrow;
//     }
//   }
// }
