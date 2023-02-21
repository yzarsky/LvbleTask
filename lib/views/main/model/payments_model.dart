import 'package:frontend_home_assignment/data/payments/entity/payments_entity.dart';

import 'payments_plan_model.dart';

class PaymentsModel {
  final int? amount;
  final List<PaymentsPlanModel>? payments;

  PaymentsModel({this.amount, this.payments});

  factory PaymentsModel.fromPaymentsEntity(PaymentsEntity? paymentsEntity) {
    return PaymentsModel(
        amount: paymentsEntity?.amount,
        payments: List.generate(
            paymentsEntity?.payments?.length ?? 0,
            (index) => PaymentsPlanModel.fromPaymentsPlanEntity(
                paymentsEntity?.payments?[index])
        ));
  }

  @override
  String toString() => 'PaymentsModel[$amount, $payments]';
}
