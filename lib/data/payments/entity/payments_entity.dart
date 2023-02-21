import 'package:json_annotation/json_annotation.dart';

import 'payments_plan.dart';

part 'payments_entity.g.dart';

@JsonSerializable()
class PaymentsEntity {
  final int? amount;

  @JsonKey(name: 'payment_plans')
  final List<PaymentsPlanEntity>? payments;

  PaymentsEntity(this.amount, this.payments);

  factory PaymentsEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsEntityToJson(this);

  @override
  String toString() => 'PaymentsEntity[$amount, $payments]';
}