import 'package:book_club/utils/color.dart';
import 'package:flutter/material.dart';

class TwistAuth extends StatelessWidget {
  
  final void Function()? tap;
  final String firstPart;
  final String secondPart;

  const TwistAuth({super.key, this.tap, required this.firstPart, required this.secondPart});

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      firstPart,
                      // style: AppTextStyle.textThirdColor,
                    ),
                    InkWell(
                        onTap: tap,
                        child: Text(
                          secondPart,
                          // style: AppTextStyle.buttonPrimaryColor,
                          style: TextStyle(color: AppColor.primaryColor ),
                        )),
                  ],
                );
  }
}