import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  String? date;
  final int? amount;

  Payment(this.date, this.amount);

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  String toString() => '[$date, $amount]';
}