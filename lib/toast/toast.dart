import 'package:flutter/material.dart';
import 'package:just_toast/toast/constant.dart';

class Toast extends StatefulWidget {
  const Toast({
    Key? key,
    required this.text,
    required this.duration,
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.color,
    required this.textStyle,
  }) : super(key: key);

  final String text;
  final Duration duration;
  final Alignment alignment;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final TextStyle textStyle;

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationForSlide;
  late Animation<double> _animationForFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: forwardDuration,
        reverseDuration: reverseDuration);
    _animationForSlide =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -.2)).animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _animationForFade = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    // _controller.forward();
    _controller.forward().whenComplete(() async {
      await Future.delayed(widget.duration);
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: widget.alignment,
        child: FadeTransition(
          opacity: _animationForFade,
          child: SlideTransition(
            position: _animationForSlide,
            child: Material(
              color: Colors.transparent,
              child: Container(
                  margin: widget.margin,
                  padding: widget.padding,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.color),
                  child: Text(widget.text, style: widget.textStyle)),
            ),
          ),
        ),
      ),
    );
  }
}
