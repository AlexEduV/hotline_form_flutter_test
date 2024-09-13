import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {

  final String hintText;
  final int maxLength;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool isPasswordField;
  final bool isObscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator validator;
  final TextInputType textInputType;


  const FormInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.maxLength = 20,
    this.suffixIcon,
    this.isPasswordField = false,
    this.isObscureText = false,
    this.onChanged,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(
            hintText,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          counterText: "",
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        onChanged: onChanged,
        maxLength: maxLength,
        textInputAction: TextInputAction.next,
        controller: controller,
        obscureText: isObscureText,
        enableSuggestions: !isPasswordField,
        autocorrect: !isPasswordField,
        enableInteractiveSelection: isPasswordField,
        keyboardType: textInputType,
      ),
    );
  }
}
