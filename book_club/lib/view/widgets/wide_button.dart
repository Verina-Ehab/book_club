

import 'package:book_club/utils/color.dart';
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String? name;
  final void Function()? tap;
  final Color? color;
  final Widget? widget;

  const WideButton({
    Key? key,
    this.name,

    this.tap,
    this.color, this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30) ,
              color: color,
            ),
            child: MaterialButton(
                onPressed: tap,
                child: widget ?? Text(
                  name!,
                  style: TextStyle(color: Theme.of(context).secondaryHeaderColor,), //grey2
                  // style: AppTextStyle.buttonWhite,
                ),
          ));
  }
}
