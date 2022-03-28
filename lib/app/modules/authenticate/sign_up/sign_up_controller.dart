import 'package:bemall_app/app/entities/address_entity.dart';
import 'package:bemall_app/app/entities/user_entity.dart';
import 'package:bemall_app/app/repositories/rest_utils/address_repository.dart';
import 'package:bemall_app/app/repositories/rest_utils/authenticate_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  ///FormSignUp formKey
  GlobalKey<FormState>? formKey;
  ///Form fields controllers
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? cepController;
  TextEditingController? numeroController;
  TextEditingController? bairroController;
  TextEditingController? logradouroController;
  TextEditingController? cidadeController;
  TextEditingController? ufController;
  //Entity to create a user
  final userEntity = UserEntity.empty();
  final address = AddressEntity.empty();
  //Repositorys API;
  final authenticateRepository = AuthenticateRepository();
  final addressRepository = AddressRepository();
  
  bool isLoadingAddress = false;
  bool hideAddress = true;

  //Initial config controllers, need be called on init of FormSignUp()
  tryInitTextEditingControllers() {
    //init form controller
    formKey = formKey ?? GlobalKey<FormState>();
    // init text editing controllers
    passwordController = passwordController ?? TextEditingController();
    confirmPasswordController =
        confirmPasswordController ?? TextEditingController();
    cepController = cepController ?? TextEditingController();
    numeroController = numeroController ?? TextEditingController();
    bairroController = bairroController ?? TextEditingController();
    logradouroController = logradouroController ?? TextEditingController();
    cidadeController = cidadeController ?? TextEditingController();
    ufController = ufController ?? TextEditingController();

    if (!cepController!.hasListeners) {
      cepController?.addListener(() {
        //The value of text field when need be the query address: 69.058-030
        if (cepController!.text.length == 10) {
          queryCep();
        }
      });
    }
  }

  SignUpController() {
    userEntity.address = [address];
  }

  Future signUp() async {
    if (formKey?.currentState?.validate() ?? false) {
      final user = await authenticateRepository.signUp(
        userEntity,
        passwordController!.text,
      );
    }
  }

  queryCep() async {
    if (cepController != null) {
      hideAddress = false;
      setLoadingAddress(true);
      try {
        final cep = cepController!.text.replaceAll('/', '').replaceAll('.', '');
        final addressResponse = await addressRepository.queryAddress(cep);
        logradouroController?.text = addressResponse.logradouro;
        bairroController?.text = addressResponse.bairro;
        cidadeController?.text = addressResponse.cidade;
        ufController?.text = addressResponse.uf;
      } finally {
        setLoadingAddress(false);
      }
    }
  }

  setLoadingAddress(bool value) {
    isLoadingAddress = false;
    update();
  }
}
