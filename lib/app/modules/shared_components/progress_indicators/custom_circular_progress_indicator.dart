
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCircularProgressIndicator extends StatelessWidget {
  double? value;
  double padding;
  double size;
  Color? color;

  EdgeInsets? margin;
  
  CustomCircularProgressIndicator({
    this.value,
    this.padding = 2,
    this.size = 40,
    this.margin,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        margin: margin,
        padding: EdgeInsets.all(padding),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          value: value,
          color: color,
        ),
      ),
    );
  }
}
