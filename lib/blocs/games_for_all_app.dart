// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gamesforall_frontend/pages/login_page.dart';
// import 'package:gamesforall_frontend/pages/register_page.dart';

// import 'authentication/authentication_bloc.dart';
// import 'authentication/authentication_event.dart';

// class GlobalContext {
//   static late BuildContext ctx;
// }

// class GamesForAllApp extends StatelessWidget {
//   static Route route() {
//     return MaterialPageRoute<void>(builder: (context) {
//       var authBloc = BlocProvider.of<AuthenticationBloc>(context);
//       authBloc..add(SessionExpiredEvent());
//       return _instance;
//     });
//   }

//   static late GamesForAllApp _instance;

//   GamesForAllApp() {
//     _instance = this;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //* Routes
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LoginPage(),
//         '/login': (context) => LoginPage(),
//         '/register': (context) => RegisterForm(),
//       },
//       debugShowCheckedModeBanner: false,
//       // home:
//     );
//   }
// }
