import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final TextInputType? keyboard;
  final bool? obsecureText;
  final void Function()? suffixOnTap;

  const MyTextFormField(
      {super.key,
      required this.label,
      this.icon,
      this.myController,
      this.valid,
      this.keyboard,
      this.obsecureText,
      this.suffixOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          TextFormField(
            obscureText: obsecureText ?? false,
            keyboardType: keyboard ?? TextInputType.text,
            validator: valid,
            controller: myController,
            decoration: InputDecoration(
                // // floatingLabelStyle: TextStyle(color: AppColor.thirdColor),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30),
                //   // borderSide:
                //   //     BorderSide(color: AppColor.thirdColor, width: 2.0)
                // ),
                labelText: label,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    onTap: suffixOnTap,
                    child: Icon(icon),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25)),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
