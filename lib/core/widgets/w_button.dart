import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assets/constants/colors.dart';

class AnimatedButton extends StatefulWidget {
  final Function() onTap;
  final String text;

  const AnimatedButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double width =2500;
  double height = 70;
  double verticalMargin = 40;
  double horizontalMargin = 50;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        verticalMargin = 30;
        height = 40;
        horizontalMargin = 40;
        setState(() {});
        print("OnTapDown");
      },
      onTapUp: (_) {
        verticalMargin = 20;
        height = 60;
        horizontalMargin = 20;
        setState(() {});
        print("onTapUp");
      },
      onTapCancel: () {
        verticalMargin = 20;
        height = 60;
        horizontalMargin = 20;
        setState(() {});
        print("onTapCancel");
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin,
          horizontal: horizontalMargin,
        ),
        width: 2000,
        height: height,
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class WButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isDisabled;
  final bool isLoading;
  final TextStyle? style;
  final Color? buttonColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Widget? child;

  WButton({
    required this.onTap,
    this.isDisabled = false,
    this.isLoading = false,
    this.text = '',
    this.style,
    this.buttonColor,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.child,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isDisabled && !isLoading) {
          onTap();
        }
      },
      child: Container(
        height: height,
        width: width ?? double.maxFinite,
        alignment: Alignment.center,
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDisabled ? disabledButtonColor : buttonColor ?? wButtonColor,
        ),
        child: Builder(
          builder: (_) {
            if (isLoading) {
              return const CupertinoActivityIndicator();
            }
            if (child == null) {
              return Text(
                text,
                style: style ??
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDisabled ? white.withOpacity(.3) : white,
                    ),
              );
            } else {
              return child!;
            }
          },
        ),
      ),
    );
  }
}
