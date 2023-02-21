import 'package:equatable/equatable.dart';

import '../model/payments_model.dart';

class MainViewState extends Equatable {
  const MainViewState();

  @override
  List<Object?> get props => [];
}

class MainViewInitState extends MainViewState {}

class MainViewLoadingState extends MainViewState {}

class MainViewPaymentsPlanLoadedState extends MainViewState {
  final PaymentsModel? paymentsModel;

  const MainViewPaymentsPlanLoadedState({required this.paymentsModel});

  @override
  List<Object?> get props => [paymentsModel];
}

class MainViewSubmitPaymentsPlanDatesCompletedState extends MainViewState {}

class MainViewSubmitPaymentsPlanDatesErrorState extends MainViewState {
  final String error;

  const MainViewSubmitPaymentsPlanDatesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}