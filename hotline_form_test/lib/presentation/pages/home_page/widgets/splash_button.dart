import 'package:flutter/material.dart';
import 'package:hotline_form_test/presentation/pages/common/globals.dart';

class SplashButton extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  const SplashButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        minimumSize: const Size.fromHeight(55.0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
