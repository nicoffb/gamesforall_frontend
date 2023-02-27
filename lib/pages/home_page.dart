// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gamesforall_frontend/pages/product_list.dart';

// import 'package:get_it/get_it.dart';

// import '../blocs/authentication/authentication_bloc.dart';
// import '../blocs/authentication/authentication_event.dart';
// import '../models/models.dart';
// import '../repositories/favorite_repository.dart';
// import '../repositories/product_repository.dart';

// class HomePage extends StatelessWidget {
//   final User user;
//   final ProductRepository productRepository;
//   final FavoriteRepository favoriteRepository;

//   const HomePage({
//     Key? key,
//     required this.user,
//     required this.productRepository,
//     required this.favoriteRepository,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final authBloc = BlocProvider.of<AuthenticationBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite),
//             onPressed: () {
//               final favoritesStream = favoriteRepository.favoritesStream;
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => ProductList(
//                     stream: favoritesStream,
//                     isFavoriteList: true,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Welcome, ${user.fullName}!',
//             style: TextStyle(fontSize: 36),
//           ),
//           const SizedBox(height: 12),
//           Expanded(
//             child: ProductList(
//               stream: productRepository.fetchProductsStream(),
//               isFavoriteList: false,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0, // Indica el índice de la pestaña actual
//         onTap: (index) {
//           // Maneja el evento de toque de la pestaña
//           if (index == 0) {
//             // Navegar a la página de inicio
//             Navigator.pushNamed(context, '/');
//           } else if (index == 1) {
//             Navigator.pushNamed(context, '/favorites');
//           } else if (index == 2) {
//             // Realizar el logout
//             authBloc.add(UserLoggedOut());
//             Navigator.pushReplacementNamed(context, '/login');
//           }
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.favorite),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.logout),
//             label: 'Logout',
//           ),
//         ],
//       ),
//     );
//   }
// }
