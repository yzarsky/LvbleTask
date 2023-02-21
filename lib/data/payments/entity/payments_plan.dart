import 'package:frontend_home_assignment/data/payments/entity/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payments_plan.g.dart';

@JsonSerializable()
class PaymentsPlanEntity {
  final String? id;
  @JsonKey(name: 'payments')
  final List<Payment>? paymentsPlan;

  PaymentsPlanEntity(this.id, this.paymentsPlan);

  factory PaymentsPlanEntity.fromJson(Map<String, dynamic> json) => _$PaymentsPlanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsPlanEntityToJson(this);

  @override
  String toString() => 'PaymentsPlanEntity[$id, $paymentsPlan]';
}