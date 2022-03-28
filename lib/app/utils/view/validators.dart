import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? validatorDate(String value) {
  if (value == 'data nasc*') {
    return 'Por favor coloque sua data de nascimento.';
  }
  return null;
}

String? validatorNumberHouse(String? value) {
  if (value?.isEmpty ?? true) {
    return "Digite um número válido";
  }
  return null;
}

String? validatorNotEmpty(String? value) {
  if (value?.isEmpty ?? true) {
    return "Obrigatório *";
  }
  return null;
}

String? validatorCpf(String value) {
  if (!GetUtils.isCpf(value)) {
    return "Coloque um CPF válido";
  }
  return null;
}

String? validatorName(String? value) {
  if (value == null || value.length < 3) {
    return "Coloque um nome válido";
  }
  return null;
}

String? validatorEmail(String? value) {
  if (value == null || !GetUtils.isEmail(value.trim())) {
    return "Coloque um e-mail válido";
  }
  return null;
}

String? validatorPhone(String? value) {
  if (value == null || value.length < 14 || !GetUtils.isPhoneNumber(value)) {
    return "Coloque um número de telefone válido";
  }
  return null;
}

String? validatorCep(String? value) {
  value = value ?? "";
  if (!RegExp(r"\d\d\.\d\d\d-\d\d\d").hasMatch(value)) {
    return "Coloque um CEP válido";
  } else if (value.length == 0) {
    return "Coloque um CEP válido.";
  }
  return null;
}

String? validatorHorse(String value) {
  if (value.length == 0 || value == '0') {
    return 'Coloque um número de casa válido';
  }
  return null;
}

String? validatorPassword(String? value) {
  if (value?.isEmpty ?? true) {
    return "Obrigatório *";
  }
  if (value != null && value.length <= 5) {
    return "Coloque uma senha mais segura";
  }
  return null;
}

String? validatorConfirmPassword(String? value, TextEditingController controller) {
  if (value?.isEmpty ?? true) {
    return "Obrigatório *";
  }
  if (controller.text != value) {
    return "As senhas não são correspondentes.";
  }
  return null;
}

String? validatorGender(String value) {
  if (value == 'sexo*') {
    return "Escolha um gênero válido";
  }
  return null;
}
