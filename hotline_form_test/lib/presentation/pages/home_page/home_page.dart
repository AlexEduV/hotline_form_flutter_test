import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotline_form_test/data/services/dio_client.dart';
import 'package:hotline_form_test/domain/usecases/validate_form_usecase.dart';
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
  bool isSubmitEnabled = false;

  final _formKey = GlobalKey<FormState>();

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

              const Text(
                'Тестова Форма',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Gap(4.0),

              const Text(
                'Будь ласка, введіть необхідну інформацію та натисніть \'Надіслати\'.',
                textAlign: TextAlign.center,
              ),

              const Gap(16.0),

              Form(
                key: _formKey,
                child: Column(
                  children: [

                    FormInputField(
                      hintText: 'Ім\'я:',
                      controller: nameController,
                      onChanged: (_) {
                        setState(() => isSubmitEnabled = _isSubmitEnabled());
                      },
                      validator: (value) => validateName(value),
                    ),

                    const Gap(8.0),

                    FormInputField(
                      hintText: 'Електронна Пошта:',
                      controller: emailController,
                      onChanged: (_) {
                        setState(() => isSubmitEnabled = _isSubmitEnabled());
                      },
                      validator: (value) => validateEmail(value),
                      textInputType: TextInputType.emailAddress,
                    ),

                    const Gap(8.0),

                    FormInputField(
                      hintText: 'Номер Телефону:',
                      controller: phoneNumberController,
                      onChanged: (_) {
                        setState(() => isSubmitEnabled = _isSubmitEnabled());
                      },
                      validator: (value) => validatePhone(value),
                      textInputType: TextInputType.phone,
                    ),

                  ],
                ),
              ),

              const Gap(32.0),

              Visibility(
                visible: isLoading,
                child: const CircularProgressIndicator(),
              ),

              const Spacer(),

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

  void _onSubmit() async {

    //validate inputs
    if (_formKey.currentState!.validate()) {

      setState(() => isLoading = true);

      //submit form data
      final result = await DioClient.submitForm(
        DioClient.endPoint,
        {
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneNumberController.text
        },
      );

      //show snackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result))
      );

      if (result == "Форма успішно відправлена") {

        //clear texts
        nameController.clear();
        emailController.clear();
        phoneNumberController.clear();

        //reset focus
        FocusScope.of(context).unfocus();

        //reset button
        setState(() => isSubmitEnabled = _isSubmitEnabled());
      }

      setState(() => isLoading = false);

    }

  }

  bool _isSubmitEnabled() {

    if (nameController.text.isNotEmpty
        && emailController.text.isNotEmpty
        && phoneNumberController.text.isNotEmpty
    ) {
      return true;
    }

    return false;

  }
}
