import 'package:frontend_home_assignment/data/payments/entity/payment.dart';
import 'package:frontend_home_assignment/data/payments/entity/payments_plan.dart';

class PaymentsPlanModel {
  final String? id;
  final List<Payment>? paymentsPlan;

  PaymentsPlanModel({this.id, this.paymentsPlan});

  factory PaymentsPlanModel.fromPaymentsPlanEntity(
      PaymentsPlanEntity? paymentsPlanEntity) {
    return PaymentsPlanModel(
        id: paymentsPlanEntity?.id,
        paymentsPlan: paymentsPlanEntity?.paymentsPlan);
  }

  @override
  String toString() => '[$id, $paymentsPlan]';
}
