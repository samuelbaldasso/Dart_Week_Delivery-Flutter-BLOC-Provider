import 'package:dw_delivery_flutter/app/core/ui/base_state/base_state.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:dw_delivery_flutter/app/pages/auth/register/register_controller.dart';
import 'package:dw_delivery_flutter/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError("Erro ao registrar usuário.");
          },
          success: () {
            hideLoader();
            showSuccess("Sucesso no cadastro.");
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastro',
                      style: context.texts.textTitle,
                    ),
                    Text(
                      'Preencha os campos abaixo para criar o seu cadastro: ',
                      style: context.texts.textMedium.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: Validatorless.required("Nome obrigatório."),
                      controller: nameEC,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.email("Email inválido."),
                        Validatorless.required("Email obrigatório"),
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
                      validator: Validatorless.multiple([
                        Validatorless.min(6, "Senha inválida."),
                        Validatorless.required("Senha obrigatória"),
                      ]),
                      obscureText: true,
                      controller: passwordEC,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Confirmar senha',
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.compare(passwordEC, "Senha incorreta."),
                        Validatorless.required("Confirmar senha obrigatório"),
                      ]),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: DeliveryButton(
                        label: 'CADASTRAR',
                        width: double.infinity,
                        onPressed: () {
                          final form = key.currentState?.validate() ?? false;
                          if (form) {
                            controller.register(
                                nameEC.text, emailEC.text, passwordEC.text);
                          }
                        },
                        height: 60,
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
