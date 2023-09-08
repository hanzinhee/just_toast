import 'package:flutter/material.dart';
import 'package:just_toast/toast/constant.dart';
import 'package:just_toast/toast/toast.dart';

void showToast({
  required BuildContext context,
  required String text,
  Duration duration = const Duration(seconds: 2),
  alignment = const Alignment(0, 0.8),
  padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  margin = const EdgeInsets.symmetric(horizontal: 12),
  color = Colors.black45,
  textStyle = const TextStyle(color: Colors.white),
}) async {
  final overlayEntry = OverlayEntry(
      builder: (_) => Toast(
            text: text,
            duration: duration,
            alignment: alignment,
            padding: padding,
            margin: margin,
            color: color,
            textStyle: textStyle,
          ));

  Navigator.of(context).overlay!.insert(overlayEntry);
  await Future.delayed(duration + forwardDuration + reverseDuration);
  overlayEntry.remove();
}
