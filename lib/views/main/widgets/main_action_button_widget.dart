import 'package:flutter/material.dart';

class MainActionButtonWidget extends StatelessWidget {

  final Function? onPressed;

  const MainActionButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(colors: [
            Color(0xff00BA77),
            Color(0xff1BD2BC),
          ], stops: [
            0.45,
            0.99
          ]),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2), blurRadius: 10, color: Color(0x32000000))
          ]),
      child: ElevatedButton(
        onPressed: onPressed != null? () => onPressed?.call() : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: const Text(
          'SPLIT MY RENT',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 2),
        ),
      ),
    );
  }
}
