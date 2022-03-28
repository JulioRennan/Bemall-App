import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ButtonText extends StatelessWidget {
  void Function()? onPressed;
  String title;
  EdgeInsets? margin;
  TextStyle? style;
  ButtonText({
    Key? key,
    this.onPressed,
    required this.title,
    this.style,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(5),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          title,
          style: style ?? Get.textTheme.bodyText2,
        ),
      ),
    );
  }
}
