import 'package:flutter/material.dart';

class PaymentPlanWidget extends StatelessWidget {
  final String planId;
  final int planNumOfPayments;
  final bool isSelected;
  final Function onPressed;

  const PaymentPlanWidget(
      {super.key,
        required this.planId,
        required this.planNumOfPayments,
        this.isSelected = false,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed.call(planId),
      child: Container(
        width: 52,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xff01BB78), Color(0xff1CD3BD)],
                    stops: [0, 98])
                : null,
            border: Border.all(width: 2, color: const Color(0xff00BA77)),
            borderRadius: const BorderRadius.all(Radius.circular(14.5))),
        child: Center(
          child: Text(
            planNumOfPayments.toString(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
