import 'package:book_club/service/auth.dart';
import 'package:book_club/utils/color.dart';
import 'package:book_club/view/screens/root.dart';
import 'package:book_club/view/screens/sign_up.dart';
import 'package:book_club/view/widgets/my_textform_field.dart';
import 'package:book_club/view/widgets/switch_auth.dart';
import 'package:book_club/view/widgets/wide_button.dart';
import 'package:flutter/material.dart';

enum LoginType {
  email,
  google,
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser(
      {String? email,
      String? password,
      required BuildContext context,
      required LoginType type}) async {
    try {
      String? _returnString;

      switch (type) {
        case LoginType.email:
          _returnString = await Auth().loginUserWithEmail(email!, password!);
          break;
        case LoginType.google:
          _returnString = await Auth().loginUserWithGoogle();
          break;
        default:
      }

      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OurRoot(),
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString!),
            duration: const Duration(seconds: 2),
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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              width: size.width * 0.5,
            ),
            SizedBox(height: size.height * 0.1),
            Form(
              child: Column(
                children: [
                  MyTextFormField(
                    myController: _emailController,
                    keyboard: TextInputType.emailAddress,
                    label: "Email",
                    icon: Icons.alternate_email,
                  ),
                  MyTextFormField(
                    myController: _passwordController,
                    obsecureText: true,
                    label: "Password",
                    icon: Icons.lock_outline,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.15),
            WideButton(
              name: "Log In",
              color: AppColor.primaryColor,
              tap: () {
                _loginUser(
                    type: LoginType.email,
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TwistAuth(
                  firstPart: "Don't have an account?   ",
                  secondPart: "Sign Up",
                  tap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp()));
                  }),
            ),
            WideButton(
              widget: Image.asset("assets/images/app_logo.png"),
              tap: () {
                _loginUser(type: LoginType.google, context: context);
              },
            )
          ],
        ),
      ),
    );
  }
}


// Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           'Login',
//           style: TextStyle(
//               color: Theme.of(context).secondaryHeaderColor,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//         child: ListView(
//           children: [
//             Image.asset(
//               "assets/images/app_logo.png",
//               width: size.width * 0.5,
//             ),
//             SizedBox(height: size.height * 0.1),
//             Card(
//               elevation: 10,
//               color: Color(0xff91A88D),
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
//                 child: Column(
//                   children: [
//                     Text("Log In"),
//                     Form(child: Column(children: [
//                       const MyTextFormField(
//                       keyboard: TextInputType.emailAddress,
//                       label: "Email",
//                       icon: Icons.alternate_email,
//                     ),
//                     const MyTextFormField(
//                       obsecureText: true,
//                       label: "Password",
//                       icon: Icons.lock_outline,
//                     ),
//                     WideButton(name: "Log In", color: Colors.white,),
//                     ],),),
//                   ],
//                 ),
//               ),
//             ),
            
//             // FlatButton()
//           ],
//         ),
//       ),
//     )