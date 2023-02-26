import 'dart:convert';

import '../models/change_password.dart';
import '../models/login.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../models/register_model.dart';
import '../rest/rest.dart';

@Order(-1)
@singleton
class AuthenticationRepository {
  late RestClient _client;

  AuthenticationRepository() {
    _client = GetIt.I.get<RestClient>();
    //_client = RestClient();
  }

  Future<dynamic> doLogin(String username, String password) async {
    String url = "/auth/login";

    var jsonResponse = await _client.post(
        url, LoginRequest(username: username, password: password));
    return LoginResponse.fromJson(jsonDecode(jsonResponse));
  }

  //NUEVAS FUNCIONES
  Future<RegisterResponse> registerUser(String username, String password,
      String verifyPassword, String email) async {
    String url = "/auth/register";

    var jsonResponse = await _client.post(
        url,
        RegisterRequest(
            username: username,
            password: password,
            verifyPassword: verifyPassword,
            email: email));
    return RegisterResponse.fromJson(jsonDecode(jsonResponse));
  }

  Future<LoginResponse> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    String url = "/user/changePassword";

    var jsonResponse = await _client.put(url, changePasswordRequest);
    return LoginResponse.fromJson(jsonDecode(jsonResponse));
  }

  Future<void> deleteAccount() async {
    String url = "/user/deleteAccount";
    await _client.delete(url);
  }
}
