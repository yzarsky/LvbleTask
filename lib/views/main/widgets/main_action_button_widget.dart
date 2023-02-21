import 'package:flutter/material.dart';

class MainActionButtonWidget extends StatelessWidget {

  final Function? onPressed;

  const MainActionButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed != null? () => onPressed?.call() : null,
      child: Container(
        height: 41,
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
        child: Center(
          child: const Text(
            'SPLIT MY RENT',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
