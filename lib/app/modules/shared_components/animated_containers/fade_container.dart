import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FadeContainer extends StatelessWidget {
  final Duration delay;
  final Widget child;

  double? width;
  double? height;
  Function()? onFade;
  RxDouble opacity = 0.0.obs;
  Clip clipBehavior;
  Decoration? decoration;

  FadeContainer({
    Key? key,
    required this.child,
    Duration? delay,
    this.clipBehavior = Clip.none,
    this.decoration,
    this.width,
    this.onFade,
    this.height,
  })  : this.delay = delay ?? Duration(milliseconds: 100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(delay).then((value) => opacity.value = 1.0);
    return Obx(() {
      return Container(
        width: width,
        height: height,
        clipBehavior: clipBehavior,
        decoration: decoration,
        alignment: Alignment.center,
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          child: child,
          opacity: opacity.value,
          onEnd: onFade,
        ),
      );
    });
  }
}
