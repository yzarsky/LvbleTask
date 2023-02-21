import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/extensions.dart';
import '../bloc/main_view_bloc.dart';
import '../model/payments_plan_model.dart';

abstract class MainViewActions {
  void fetchPayments(BuildContext context);

  void splitRent(BuildContext context, PaymentsPlanModel paymentsPlanModel);

  String getAmountDollars(int amountInCents);

  String getCurrency();

  String getAmountCents(int totalAmountInCents);

  DateTime getEarliestDateInPlan(PaymentsPlanModel plan, int currentDateIndex);

  DateTime getLatestDateInPlan(PaymentsPlanModel plan, int currentDateIndex);
}

class MainViewActionsImpl extends MainViewActions {

  @override
  void fetchPayments(BuildContext context) {
    context.read<MainViewBloc>().fetchPayments();
  }

  @override
  void splitRent(BuildContext context, PaymentsPlanModel paymentsPlanModel) {
    debugPrint('MainViewActions splitRent');
    context.read<MainViewBloc>().submitPaymentsPlanDate(paymentsPlanModel);
  }

  @override
  String getAmountDollars(int amountInCents) {
    final numberFormat = NumberFormat("#,##0", "en_US");
    var dollars = amountInCents ~/100;
    return numberFormat.format(dollars);
  }

  @override
  String getCurrency() => '\$';

  @override
  String getAmountCents(int totalAmountInCents) {
    var cents = totalAmountInCents % 100;
    return '.$cents';
  }

  @override
  DateTime getEarliestDateInPlan(PaymentsPlanModel plan, int currentDateIndex) {
    var currentDate = plan.paymentsPlan![currentDateIndex].date!.toDate();
    if (currentDateIndex <= 0) { /// first date
      return currentDate;
    } else {
      if (plan.paymentsPlan?[currentDateIndex-1].date.isStringNotEmpty() ?? false) {
        return plan.paymentsPlan![currentDateIndex - 1].date!.toDate().add(const Duration(days: 1)); /// one day after previous date
      } else {
        return currentDate;
      }
    }
  }

  @override
  DateTime getLatestDateInPlan(PaymentsPlanModel plan, int currentDateIndex) {
    var currentDate = plan.paymentsPlan![currentDateIndex].date!.toDate();
    if (currentDateIndex >= (plan.paymentsPlan?.length ?? 0)-1) { /// last date
      return currentDate;
    } else {
      if (plan.paymentsPlan?[currentDateIndex + 1].date.isStringNotEmpty() ?? false) {
        return plan.paymentsPlan![currentDateIndex + 1].date!.toDate().subtract(const Duration(days: 1)); /// one day before next date
      } else {
        return currentDate;
      }
    }
  }
}