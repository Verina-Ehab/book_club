import 'package:book_club/service/auth.dart';
import 'package:book_club/utils/color.dart';
import 'package:book_club/view/widgets/my_textform_field.dart';
import 'package:book_club/view/widgets/wide_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {
    try {
      String _returnString = await Auth().signUpUser(email, password, fullName);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColor.grey2,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [BackButton()],
            // ),
            Image.asset(
              "assets/images/app_logo.png",
              width: size.width * 0.5,
            ),
            SizedBox(height: size.height * 0.05),
            Form(
              child: Column(
                children: [
                  MyTextFormField(
                    myController: _fullNameController,
                    keyboard: TextInputType.emailAddress,
                    label: "Full Name",
                    icon: Icons.person,
                  ),
                  MyTextFormField(
                    myController: _emailController,
                    label: "Email",
                    icon: Icons.alternate_email,
                  ),
                  MyTextFormField(
                    myController: _passwordController,
                    obsecureText: true,
                    keyboard: TextInputType.emailAddress,
                    label: "Password",
                    icon: Icons.lock_outline,
                  ),
                  MyTextFormField(
                    myController: _confirmPasswordController,
                    obsecureText: true,
                    label: "Confirm Password",
                    icon: Icons.lock_outline,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            WideButton(
              name: "Sign Up",
              color: AppColor.primaryColor,
              tap: () {
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  _signUpUser(_emailController.text, _passwordController.text,
                      context, _fullNameController.text);
                }else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Passwords do not match"),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
              },
            ),
          ],
        ),
      ),
    );
  }
}
