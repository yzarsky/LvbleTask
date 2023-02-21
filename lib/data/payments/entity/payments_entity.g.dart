// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsEntity _$PaymentsEntityFromJson(Map<String, dynamic> json) =>
    PaymentsEntity(
      json['amount'] as int?,
      (json['payment_plans'] as List<dynamic>?)
          ?.map((e) => PaymentsPlanEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentsEntityToJson(PaymentsEntity instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_plans': instance.payments,
    };
