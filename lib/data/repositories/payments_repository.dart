import 'package:flutter/material.dart';
import 'package:frontend_home_assignment/data/payments/entity/payments_entity.dart';
import 'package:frontend_home_assignment/views/main/model/payments_model.dart';

import '../../core/utils/extensions.dart';
import '../../views/main/model/payments_plan_model.dart';
import '../payments/api/payments_api.dart';

abstract class PaymentsRepository {
  Future<PaymentsModel?> fetchPayments();

  Future<String?> submitPaymentsPlanDates(PaymentsPlanModel paymentsPlanModel);
}

class PaymentsRepositoryImpl extends PaymentsRepository {
  final PaymentsApi paymentsApi;

  PaymentsRepositoryImpl({required this.paymentsApi});

  @override
  Future<PaymentsModel?> fetchPayments() async {
    PaymentsEntity? paymentsEntity;
    try {
      var response = await paymentsApi.fetchPayments();
      if (response.data != null) {
        paymentsEntity = PaymentsEntity.fromJson(response.data);
      }
    } catch (e, s) {
      debugPrint('PaymentsRepository fetchPayments error: $e');
    }
    // debugPrint('PaymentsRepository fetchPayments $paymentPlanList');
    return PaymentsModel.fromPaymentsEntity(paymentsEntity);
  }

  @override
  Future<String?> submitPaymentsPlanDates(PaymentsPlanModel paymentsPlanModel) async {
    String? error;
    try {
      var data = <String, dynamic>{};
      data['id'] = paymentsPlanModel.id;
      data['dates'] = paymentsPlanModel.paymentsPlan?.map((item) {
        if (item.date.isStringNotEmpty()) {
          return item.date!.toDate().toIso8601String();
        }
      }).toList();
      var response = await paymentsApi.splitRent(data);
      if (response.statusCode == 200) {
        if (response.data != null && response.data.toString().isStringNotEmpty()) {
          error = response.data.toString();
        }
      } else {
        error = 'Something went wrong';
      }
    } catch (e, s) {
      debugPrint('PaymentsRepository splitRent error: $e');
      error = 'Something went wrong';
    }
    debugPrint('PaymentsRepository splitRent $error');
    return error;
  }
}