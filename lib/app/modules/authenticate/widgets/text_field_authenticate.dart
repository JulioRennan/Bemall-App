import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldAuthenticate extends StatelessWidget {
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Icon? prefixIcon;
  const TextFieldAuthenticate({
    Key? key,
    this.controller,
    this.labelText,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
      ),
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
