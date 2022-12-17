import 'package:e_commerce/features/auth/screens/login_screen.dart';
import 'package:e_commerce/features/auth/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../util/utils.dart';
import '../services/firebase_auth_method.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  /// Global key to uniquely identify the [Form] of signUp and SignIn.
  final _singUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  /// TextEditingController for email , password  Text Field.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.2,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Form(
              key: _singUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Register in to get started'),
                  const Text('Experience teh all New App!'),
                  CustomTextField(
                      icon: Icons.verified_user,
                      controller: _nameController,
                      hintText: 'Name'),
                  CustomTextField(
                      icon: Icons.email,
                      controller: _emailController,
                      hintText: 'E-mail ID'),
                  CustomTextField(
                      icon: Icons.phone,
                      controller: _mobileController,
                      hintText: 'Mobile Number'),
                  CustomTextField(
                      obscureText: true,
                      icon: Icons.lock,
                      controller: _passwordController,
                      hintText: 'Password'),
                  TextFormField(
                    obscureText: true,
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock), hintText: 'Confirm Password'),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the value';
                      }
                      if (value != _passwordController.text) {
                        return 'Not Matching';
                      }
                      return null;
                    }),
                  ),
                  CustomButoon(
                    text: 'Register',
                    onTap: (() async {
                      if (_singUpFormKey.currentState!.validate()) {
                        final isSignedUp = await AuthenticationService.signUp(
                            email: _emailController.text,
                            password: _passwordController.text);

                        if (!mounted) return;
                        if (isSignedUp == 'success') {
                          Util.showSnack(context, content: 'User Signed Up');
                          // Navigator.pushNamed(
                          //     context, FibnnaciScreen.id);
                        } else {
                          Util.showSnack(context,
                              content: isSignedUp ?? 'unknown Error');
                        }
                      }
                    }),
                  ),
                  Row(
                    children: [
                      const Text('Already have an account?'),
                      GestureDetector(
                        child: const Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
