import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:practices/modules/login_screen.dart';
import 'package:practices/shaered/commponent.dart';

class RegisterScreeen extends StatelessWidget {
  RegisterScreeen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20.0,
                      child: IconButton(
                          onPressed: () {
                            navigateTo(context, LoginScreen());
                          },
                          icon: Icon(Icons.arrow_back_ios,size: 24.0,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
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
                              'Register',
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
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'email address',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter enter your email';
                              }
                            },
                            isPassword: false),
                        SizedBox(
                          height: 15.0,
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
                          height: 15.0,
                        ),
                        DefaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: 'password',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter enter password';
                              }
                            },
                            isPassword: true,
                            suffix: Icons.remove_red_eye_sharp),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          text: 'Register',
                          isUpperCase: true,
                        ),
                        SizedBox(
                          height: 15,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' has any account? '),
                            defaultTextButton(
                                function: () {
                                  navigateTo(context, LoginScreen());
                                },
                                text: 'login'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
