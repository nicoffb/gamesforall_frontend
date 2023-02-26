import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../config/locator.dart';
import '../services/authentication_service.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final registerAsOwner = BooleanFieldBloc();
  late final AuthenticationService _authenticationService;

  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
  );

  final verifyPassword = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars,
    ],
  );

  final email = TextFieldBloc<String>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  RegisterFormBloc() {
    _authenticationService = getIt<JwtAuthenticationService>();
    addFieldBlocs(
      step: 0,
      fieldBlocs: [registerAsOwner],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [username, password, verifyPassword, email],
    );
  }

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      emitSuccess();
    } else if (state.currentStep == 1) {
      if (password.value != verifyPassword.value) {
        verifyPassword.addFieldError("Las contraseñas no coinciden");
        emitFailure();
      } else {
        try {
          final result = await _authenticationService.registerUser(
              username.value,
              password.value,
              verifyPassword.value,
              email.value);
          emitSuccess();
        } on Exception catch (e) {
          emitFailure();
        }
      }
    }
  }
}
