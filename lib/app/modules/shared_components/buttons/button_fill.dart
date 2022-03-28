import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_theme.dart';
import '../animated_containers/fade_container.dart';
import '../progress_indicators/custom_circular_progress_indicator.dart';

// ignore: must_be_immutable
class ButtonFill extends StatelessWidget {
  Function onTap;
  RxBool isLoading = false.obs;
  double? width;
  double heigth;
  String title;
  Color color;
  Color colorText;
  double fontSize;

  BorderRadius borderRadius;

  ButtonFill({
    Key? key,
    this.width = 300,
    this.heigth = 40,
    this.fontSize = 18,
    required this.title,
    required this.onTap,
    Color? colorText,
    BorderRadius? borderRadius,
    Color? color,
  })  : this.color = color ?? AppTheme.appColors.primaryColor,
        this.colorText = colorText ?? AppTheme.appColors.lightColor,
        this.borderRadius = borderRadius ?? BorderRadius.circular(5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Obx(() {
        return InkWell(
          onTap: isLoading.value
              ? null
              : () async {
                  isLoading.value = true;

                  try {
                    await onTap();
                  } catch (e, stack) {
                    print(stack);
                  }

                  isLoading.value = false;
                },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.linearToEaseOut,
            width: isLoading.value ? heigth : width,
            padding: EdgeInsets.all(5),
            height: heigth,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color,
                borderRadius: isLoading.value
                    ? BorderRadius.circular(100)
                    : borderRadius),
            child: isLoading.value
                ? CustomCircularProgressIndicator(
                    color: colorText,
                  )
                : FadeContainer(
                    child: Text(
                      this.title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: colorText,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
