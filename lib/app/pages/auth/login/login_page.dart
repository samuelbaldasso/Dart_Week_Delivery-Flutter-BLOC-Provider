import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:dw_delivery_flutter/app/pages/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final key = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader(),
          loginError: () {
            hideLoader();
            showError("Erro ao logar usuário.");
          },
          error: () {
            hideLoader();
            showError("Erro ao logar usuário.");
          },
          success: () {
            hideLoader();
            showSuccess("Sucesso no login.");
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: context.texts.textTitle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required("Email obrigatório."),
                          Validatorless.email("Email inválido."),
                        ]),
                        controller: emailEC,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        validator: Validatorless.required("Senha obrigatória."),
                        controller: passwordEC,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: DeliveryButton(
                          label: 'ENTRAR',
                          width: double.infinity,
                          onPressed: () {
                            final form = key.currentState?.validate() ?? false;
                            if (form) {
                              controller.login(emailEC.text, passwordEC.text);
                            }
                          },
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não possui uma conta?',
                          style: context.texts.textBold,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/auth/register');
                            },
                            child: Text(
                              'Cadastre-se',
                              style: context.texts.textBold.copyWith(
                                color: Colors.blue,
                              ),
                            )),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
