import 'package:e_commerce/features/auth/services/firebase_auth_method.dart';
import 'package:e_commerce/features/auth/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:e_commerce/features/product/product_screen.dart';
import 'package:e_commerce/util/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Global key to uniquely identify the [Form] of signUp and SignIn.
  final _signInFormKey = GlobalKey<FormState>();

  /// TextEditingController for email , password  Text Field.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              key: _signInFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Login  to get started'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Experience the all New App!'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      icon: Icons.email,
                      controller: _emailController,
                      hintText: 'E-mail ID'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      obscureText: true,
                      icon: Icons.lock,
                      controller: _passwordController,
                      hintText: 'Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButoon(
                    text: 'Register',
                    onTap: (() async {
                      if (_signInFormKey.currentState!.validate()) {
                        final isSignedIn = await AuthenticationService.singIn(
                            email: _emailController.text,
                            password: _passwordController.text);

                        if (!mounted) return;
                        if (isSignedIn == 'success') {
                          Util.showSnack(context, content: 'User Signed In');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProdcutScreen()),
                          );
                        } else {
                          Util.showSnack(context,
                              content: isSignedIn ?? 'unknown Error');
                        }
                      }
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: const Text(
                          'Use Mobile Number',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        onTap: () {},
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
