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
  double width = 2500;
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

class WButton extends StatefulWidget {
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

  const WButton({
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
  State<WButton> createState() => _WButtonState();
}

class _WButtonState extends State<WButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    animation = Tween<double>(begin: 1, end: 0).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isDisabled && !widget.isLoading) {
          widget.onTap();
        }
        if (animationController.status == AnimationStatus.dismissed) {
          animationController.forward();
        } else if (animationController.status == AnimationStatus.completed) {
          animationController.reverse();
        }
        setState(() {});
      },
      child:
          // WFade(
          //   animation: animation,
          // )

          WFade(
        animation: animation,
        child: Container(
          height: widget.height,
          width: widget.width ?? double.maxFinite,
          alignment: Alignment.center,
          margin: widget.margin ?? EdgeInsets.zero,
          padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.isDisabled
                ? disabledButtonColor
                : widget.buttonColor ?? wButtonColor,
          ),
          child: Builder(
            builder: (_) {
              if (widget.isLoading) {
                return const CupertinoActivityIndicator();
              }
              if (widget.child == null) {
                return Text(
                  widget.text,
                  style: widget.style ??
                      TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:
                            widget.isDisabled ? white.withOpacity(.3) : white,
                      ),
                );
              } else {
                return widget.child!;
              }
            },
          ),
        ),
      ),
    );
  }
}

class WFade extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const WFade({super.key, required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        // height: 42,
        // width: 90,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}

//  onPressed: () {

//         },