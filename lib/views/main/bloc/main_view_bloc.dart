import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_home_assignment/data/repositories/payments_repository.dart';
import 'package:frontend_home_assignment/views/main/bloc/main_view_state.dart';
import 'package:frontend_home_assignment/views/main/model/payments_plan_model.dart';

import '../../../core/utils/extensions.dart';

class MainViewBloc extends Cubit<MainViewState> {
  final PaymentsRepository paymentsRepository;

  MainViewBloc({required this.paymentsRepository}) : super(MainViewInitState());

  Future<void> fetchPayments() async {
    emit(MainViewLoadingState());
    var paymentsEntity = await paymentsRepository.fetchPayments();
    emit(MainViewPaymentsPlanLoadedState(paymentsModel: paymentsEntity));
  }

  Future<void> submitPaymentsPlanDate(PaymentsPlanModel paymentsPlanModel) async {
    emit(MainViewLoadingState());
    var error = await paymentsRepository.submitPaymentsPlanDates(paymentsPlanModel);
    if (error.isStringNotEmpty()) {
      emit(MainViewSubmitPaymentsPlanDatesErrorState(error!));
    } else {
      emit(MainViewSubmitPaymentsPlanDatesCompletedState());
    }
  }
}