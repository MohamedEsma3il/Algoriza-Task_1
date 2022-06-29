import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:practices/modules/register_screen.dart';
import 'package:practices/shaered/commponent.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.indigo),
                  width: double.infinity,
                  child: Image(
                      image: AssetImage('assets/images/Sign up-amico.png'),
                      fit: BoxFit.fill),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Welcome to Fashion Daily',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Help',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Icon(
                          Icons.help,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    DefaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: 'phone',
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter enter yourphone';
                          }
                        },
                        prefix: CountryCodePicker(
                          initialSelection:'eg' ,
                          favorite: ['+20', 'eg'],
                          showCountryOnly: true ,
                        ),
                        isPassword: false),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        text: 'Sign in with Google',
                        isUpperCase: true,
                        background: Colors.white,
                        textColor: Colors.blue),
                    SizedBox(
                      height: 15,
                    ),
                    defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      text: 'Sign in',
                      isUpperCase: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dosen\'t have account? '),
                        defaultTextButton(
                            function: () {
                              navigateTo(context, RegisterScreeen());
                            },
                            text: 'Register here'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
