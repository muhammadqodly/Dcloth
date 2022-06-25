import 'package:dcloth/components/custom_surfix_icon.dart';
import 'package:dcloth/components/default_button.dart';
import 'package:dcloth/components/form_error.dart';
import 'package:dcloth/constants.dart';
import 'package:dcloth/screens/login_success/login_success_screen.dart';
import 'package:dcloth/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../sign_up/sign_up_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(80),
                ),
                Text(
                  "Wellcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: const CustomSurfix(
                      svgIcon: "assets/icons/Mail.svg",
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: const CustomSurfix(
                      svgIcon: "assets/icons/Lock.svg",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.9,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 59, 82, 228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        final navigator = Navigator.of(context);
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        navigator
                            .pushReplacementNamed(LoginSuccessScreen.routeName);
                      } on FirebaseAuthException catch (e) {
                        showNotification(context, e.message.toString());
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                        text: "Sign Up",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blue, content: Text(message.toString())));
  }
}

// class SignForm extends StatefulWidget {
//   const SignForm({Key? key}) : super(key: key);

//   @override
//   State<SignForm> createState() => _SignFormState();
// }

// class _SignFormState extends State<SignForm> {
//   //final _formKey = GlobalKey<FormState>();
//   // late String email;
//   // late String password;
//   //final List<String> errors = [];

//   // controller
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
  

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim());
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }





  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       children: [
  //         buildEmailFormField(),
  //         SizedBox(
  //           height: getProportionateScreenHeight(20),
  //         ),
  //         buildPasswordFormField(),
  //         SizedBox(
  //           height: getProportionateScreenHeight(20),
  //         ),
  //         formError(errors: errors),
  //         SizedBox(
  //           height: getProportionateScreenHeight(20),
  //         ),
  //         login(context)
  //       ],
  //     ),
  //   );
  // }

  // DefaultButton login(BuildContext context) {
  //   return DefaultButton(
  //       text: "Continue",
  //       press: () {
  //         if (_formKey.currentState!.validate()) {
  //           _formKey.currentState!.save();
  //           Navigator.pushNamed(context, LoginSuccessScreen.routeName);
  //         }
  //       });
  // }

  // TextFormField buildPasswordFormField() {
  //   return TextFormField(
  //     // controller: _passwordController,
  //     obscureText: true,
  //     onSaved: (newValue) => password = newValue!,
  //     onChanged: (value) {
  //       if (value.isNotEmpty && errors.contains(kPassNullError)) {
  //         setState(() {
  //           errors.remove(kPassNullError);
  //         });
  //       } else if (value.length >= 8 && errors.contains(kShortPassError)) {
  //         setState(() {
  //           errors.remove(kShortPassError);
  //         });
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty && !errors.contains(kPassNullError)) {
  //         setState(() {
  //           errors.add(kPassNullError);
  //         });
  //         return "";
  //       } else if (value.length < 8 && !errors.contains(kShortPassError)) {
  //         setState(() {
  //           errors.add(kShortPassError);
  //         });
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Password",
  //       hintText: "Enter your password",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurfix(
  //         svgIcon: "assets/icons/Lock.svg",
  //       ),
  //     ),
  //   );
  // }

  // TextFormField buildEmailFormField() {
  //   return TextFormField(
  //     // controller: _emailController,
  //     keyboardType: TextInputType.emailAddress,
  //     onSaved: (newValue) => email = newValue!,
  //     onChanged: (value) {
  //       if (value.isNotEmpty && errors.contains(kEmailNullError)) {
  //         setState(() {
  //           errors.remove(kEmailNullError);
  //         });
  //       } else if (emailValidatorRegExp.hasMatch(value) &&
  //           errors.contains(kInvalidEmailError)) {
  //         setState(() {
  //           errors.remove(kInvalidEmailError);
  //         });
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty && !errors.contains(kEmailNullError)) {
  //         setState(() {
  //           errors.add(kEmailNullError);
  //         });
  //         return "";
  //       } else if (!emailValidatorRegExp.hasMatch(value) &&
  //           !errors.contains(kInvalidEmailError)) {
  //         setState(() {
  //           errors.add(kInvalidEmailError);
  //         });
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Email",
  //       hintText: "Enter your email",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurfix(
  //         svgIcon: "assets/icons/Mail.svg",
  //       ),
  //     ),
  //   );
//   }
// }
