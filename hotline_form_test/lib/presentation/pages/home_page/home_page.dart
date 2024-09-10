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

  bool isLoading = false;

  bool isNameEmpty = true;


  bool isSubmitEnabled = false;

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

              Gap(4.0),

              Text(
                'Будь ласка, введіть необхідну інформацію та натисніть \'Надіслати\'.',
                textAlign: TextAlign.center,
              ),

              Gap(16.0),

              FormInputField(
                hintText: 'Ім\'я:',
                controller: nameController,
                onChanged: (value) {
                 _isSubmitEnabled();
                },
              ),

              Gap(8.0),

              FormInputField(
                hintText: 'Електронна Пошта:',
                controller: emailController,
                onChanged: (value) {
                  _isSubmitEnabled();
                },
              ),

              Gap(8.0),

              FormInputField(
                hintText: 'Номер Телефону:',
                controller: phoneNumberController,
                onChanged: (value) {
                  _isSubmitEnabled();
                },
              ),

              Gap(32.0),

              Visibility(
                visible: isLoading,
                child: CircularProgressIndicator(),
              ),

              Spacer(),

              SplashButton(
                text: 'Надіслати',
                onPressed: !isLoading && isSubmitEnabled ? _onSubmit : null,
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 3), () {

      setState(() {
        isLoading = false;
      });

    });

  }

  void _isSubmitEnabled() {

    bool result = false;

    if (!nameController.text.isEmpty
        && !emailController.text.isEmpty
        && !phoneNumberController.text.isEmpty
    ) {
      result = true;
    }

    setState(() {
      isSubmitEnabled = result;
    });

  }
}
