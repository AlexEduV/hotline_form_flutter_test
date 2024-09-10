import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotline_form_test/presentation/pages/home_page/widgets/splash_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                'Test Form',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Gap(8.0),

              Text(
                'Please, enter all the necessary information and hit \'Submit\'',
                textAlign: TextAlign.center,
              ),

              TextFormField(),

              TextFormField(),

              TextFormField(),

              CircularProgressIndicator(),

              Spacer(),

              SplashButton(
                text: 'Submit',
                onPressed: () {},
              )

            ],
          ),
        ),
      ),
    );
  }
}
