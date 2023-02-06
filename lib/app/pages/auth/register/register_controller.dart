import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw_delivery_flutter/app/pages/auth/register/register_state.dart';
import 'package:dw_delivery_flutter/app/repositories/auth/auth_repository.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository authRepository;
  RegisterController({required this.authRepository})
      : super(RegisterState.initial());

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));
      await authRepository.register(name, email, password);
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      log('Erro ao registrar usuário.');
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
