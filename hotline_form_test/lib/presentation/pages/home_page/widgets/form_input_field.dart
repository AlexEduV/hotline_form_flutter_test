import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {

  final String hintText;
  final int maxLength;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool isPasswordField;
  final bool isObscureText;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const FormInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLength = 20,
    this.suffixIcon,
    this.isPasswordField = false,
    this.isObscureText = false,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(
            hintText,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          counterText: "",
          suffixIcon: suffixIcon,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required.';
          }
          else if (value.length < 2) {
            return 'The name should be at least 2 characters.';
          }
          return null;
        },
        maxLength: maxLength,
        textInputAction: TextInputAction.next,
        controller: controller,
        obscureText: isObscureText,
        enableSuggestions: !isPasswordField,
        autocorrect: !isPasswordField,
        enableInteractiveSelection: isPasswordField,
      ),
    );
  }
}
