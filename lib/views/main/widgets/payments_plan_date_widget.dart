import 'package:flutter/material.dart';

import '../../../core/utils/extensions.dart';

class PaymentsPlanDateWidget extends StatelessWidget {
  final String date;
  final String amount;
  final String currency;
  final bool isFirst;
  final bool isLast;
  final Function onPressed;

  const PaymentsPlanDateWidget(
      {super.key,
      required this.date,
      required this.amount,
      required this.currency,
      this.isFirst = false,
      this.isLast = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed.call(),
      child: Column(
        children: [
          Text(
            date.toDisplayDateFormat(),
            style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: Color(0x4f082431)),
          ),
          SizedBox(
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: isFirst ? null : const Color(0x33000000),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7, bottom: 5),
                  width: 15,
                  height: 15,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: const RadialGradient(colors: [
                          Color(0xff2EC790),
                          Color(0x9c7EDCBB),
                          Color(0x00FFFFFF),
                        ], stops: [
                          0.1,
                          0.81,
                          1
                        ]),
                        border:
                            Border.all(width: 1, color: const Color(0xff2EC790)),
                        shape: BoxShape.circle),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: isLast ? null : const Color(0x33000000),
                  ),
                ),
              ],
            ),
          ),
          Text('$currency$amount',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff082431))),
        ],
      ),
    );
  }
}
