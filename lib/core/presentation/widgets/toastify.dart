import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void toastify({
  required BuildContext context,
  required String title,
  required String description,
}) {
  toastification.show(
    context: context,
    type: ToastificationType.info,
    style: ToastificationStyle.flat,
    title: title,
    description: description,
    alignment: Alignment.topLeft,
    autoCloseDuration: const Duration(
      seconds: 3,
      milliseconds: 500,
    ),
    animationBuilder: (
      context,
      animation,
      alignment,
      child,
    ) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: lowModeShadow,
    dragToClose: true,
    pauseOnHover: false,
  );
}
