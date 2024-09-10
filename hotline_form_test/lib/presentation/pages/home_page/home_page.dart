import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotline_form_test/presentation/pages/home_page/widgets/form_input_field.dart';
import 'package:hotline_form_test/presentation/pages/home_page/widgets/splash_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [

              Text(
                'Тестова Форма',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Gap(8.0),

              Text(
                'Будь ласка, введіть необхідну інформацію та натисніть \'Надіслати\'.',
                textAlign: TextAlign.center,
              ),

              Gap(16.0),

              FormInputField(
                hintText: 'Ім\'я:',
                controller: nameController,
              ),

              Gap(8.0),

              FormInputField(
                hintText: 'Електронна Пошта:',
                controller: emailController,
              ),

              Gap(8.0),

              FormInputField(
                  hintText: 'Номер Телефону:',
                  controller: phoneNumberController,
              ),

              Gap(16.0),

              CircularProgressIndicator(),

              Spacer(),

              SplashButton(
                text: 'Надіслати',
                onPressed: () {},
              )

            ],
          ),
        ),
      ),
    );
  }
}