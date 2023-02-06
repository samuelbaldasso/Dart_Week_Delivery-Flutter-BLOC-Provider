import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw_delivery_flutter/app/core/exceptions/unauthorized_exception.dart';
import 'package:dw_delivery_flutter/app/pages/auth/login/login_state.dart';
import 'package:dw_delivery_flutter/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  LoginController(this._authRepository) : super(const LoginState.initial());

  final AuthRepository _authRepository;

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString(
        "accessToken",
        authModel.accessToken,
      );
      sp.setString(
        "refreshToken",
        authModel.refreshToken,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      log("Login ou senha inváldos.", error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: "Login ou senha inváldos."));
    } on Exception catch (e, s) {
      log("Erro ao realizar login.", error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: "Erro ao realizar login."));
    }
  }
}
