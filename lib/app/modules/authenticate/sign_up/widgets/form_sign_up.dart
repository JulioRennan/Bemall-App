import 'package:bemall_app/app/modules/authenticate/sign_up/sign_up_controller.dart';
import 'package:bemall_app/app/modules/shared_components/animated_containers/fade_container.dart';
import 'package:bemall_app/app/modules/shared_components/progress_indicators/custom_circular_progress_indicator.dart';
import 'package:bemall_app/app/utils/view/validators.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/text_field_authenticate.dart';

class FormSignUp extends StatelessWidget {
  final SignUpController controller;
  FormSignUp({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    controller.tryInitTextEditingControllers();
  }

  @override
  Widget build(BuildContext context) {
    return FadeContainer(
      child: Form(
        key: controller.formKey,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          TextFieldAuthenticate(
            labelText: "Nome*",
            keyboardType: TextInputType.name,
            validator: validatorName,
            onChanged: (value) => controller.userEntity.name = value,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldAuthenticate(
            labelText: "Email*",
            keyboardType: TextInputType.emailAddress,
            validator: validatorEmail,
            onChanged: (value) => controller.userEntity.email = value,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldAuthenticate(
            labelText: "CEP*",
            controller: controller.cepController,
            keyboardType: TextInputType.number,
            validator: validatorCep,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            onChanged: (value) => controller.address.cep = value,
          ),
          if (controller.isLoadingAddress && !controller.hideAddress)
            CustomCircularProgressIndicator()
          else if (controller.hideAddress)
            Container()
          else
            FadeContainer(
                child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: TextFieldAuthenticate(
                        labelText: "Rua*",
                        validator: validatorName,
                        controller: controller.logradouroController,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) =>
                            controller.address.logradouro = value,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFieldAuthenticate(
                        labelText: "Número*",
                        validator: validatorNumberHouse,
                        controller: controller.numeroController,
                        onChanged: (value) =>
                            controller.address.numero = int.parse(value),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldAuthenticate(
                  labelText: "Bairro*",
                  controller: controller.bairroController,
                  keyboardType: TextInputType.name,
                  validator: validatorName,
                  onChanged: (value) => controller.address.bairro = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 4,
                      child: TextFieldAuthenticate(
                        labelText: "Cidade*",
                        controller: controller.cidadeController,
                        maxLength: 30,
                        validator: validatorName,
                        onChanged: (value) => controller.address.cidade = value,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFieldAuthenticate(
                        labelText: "UF*",
                        validator: validatorNotEmpty,
                        controller: controller.ufController,
                        maxLength: 2,
                        keyboardType: TextInputType.name,
                        onChanged: (value) => controller.address.uf = value,
                      ),
                    ),
                  ],
                ),
                TextFieldAuthenticate(
                  controller: controller.passwordController,
                  labelText: "Senha*",
                  validator: validatorPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldAuthenticate(
                  controller: controller.confirmPasswordController,
                  labelText: "Confirme sua senha*",
                  validator: (value) => validatorConfirmPassword(
                    value,
                    controller.passwordController!,
                  ),
                ),
              ],
            ))
        ]),
      ),
    );
  }
}
