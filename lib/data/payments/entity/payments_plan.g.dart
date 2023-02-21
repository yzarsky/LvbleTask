// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsPlanEntity _$PaymentsPlanEntityFromJson(Map<String, dynamic> json) =>
    PaymentsPlanEntity(
      json['id'] as String?,
      (json['payments'] as List<dynamic>?)
          ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentsPlanEntityToJson(PaymentsPlanEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payments': instance.paymentsPlan,
    };
