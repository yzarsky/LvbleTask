import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_home_assignment/views/main/logic/main_view_actions.dart';
import 'package:frontend_home_assignment/views/main/widgets/loading_widget.dart';
import 'package:frontend_home_assignment/views/main/widgets/main_action_button_widget.dart';
import 'package:frontend_home_assignment/views/main/widgets/payment_plan_widget.dart';
import 'package:frontend_home_assignment/views/main/widgets/payments_plan_date_widget.dart';

import '../../../core/utils/extensions.dart';
import '../../dialogs.dart';
import '../bloc/main_view_bloc.dart';
import '../bloc/main_view_state.dart';
import '../model/payments_plan_model.dart';

class MainView extends StatefulWidget {
  final MainViewActions mainViewActions;

  const MainView({super.key, required this.mainViewActions});

  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool _showLoading = false;

  int? _amount;
  List<PaymentsPlanModel>? _paymentsPlan = [];
  PaymentsPlanModel? _selectedPlan;

  @override
  void initState() {
    _showLoading = true;
    widget.mainViewActions.fetchPayments(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocListener<MainViewBloc, MainViewState>(
              listener: (context, state) {
                debugPrint('MainView MainViewBloc listener: $state');
                if (state is MainViewLoadingState) {
                  showLoading();
                } else if (state is MainViewPaymentsPlanLoadedState) {
                  setState(() {
                    _amount = state.paymentsModel?.amount;
                    _paymentsPlan = state.paymentsModel?.payments;
                    _selectedPlan = _paymentsPlan?.first;
                    _showLoading = false;
                  });
                } else if (state
                    is MainViewSubmitPaymentsPlanDatesCompletedState) {
                  showResultDialog(context, 'Success');
                  showLoading(show: false);
                } else if (state is MainViewSubmitPaymentsPlanDatesErrorState) {
                  showResultDialog(context, state.error);
                  showLoading(show: false);
                }
              },
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 22, right: 35, left: 35, bottom: 56),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/logo.svg'),
                        ],
                      ),
                      if (_amount != null) ...[
                        Container(
                          margin: const EdgeInsets.only(top: 99),
                          child: Column(
                            children: [
                              const Text(
                                'Your Rent',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xcc2C2C63)),
                              ),
                              Text.rich(
                                TextSpan(
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xcc2C2C63)),
                                    children: [
                                      TextSpan(
                                          text: widget.mainViewActions
                                              .getCurrency()),
                                      TextSpan(
                                          text: widget.mainViewActions
                                              .getAmountDollars(_amount!)),
                                      TextSpan(
                                          text: widget.mainViewActions
                                              .getAmountCents(_amount!),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xcc2C2C63))),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (_paymentsPlan.isListNotEmpty()) ...[
                        Container(
                          margin: const EdgeInsets.only(top: 65),
                          child: Column(
                            children: [
                              const Text('Your installments plan',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xcc2C2C63))),
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2,
                                        color: const Color(0xff2EC790)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 22, right: 50, left: 50),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (var plan in _paymentsPlan!) ...[
                                            PaymentPlanWidget(
                                                planId: plan.id!,
                                                planNumOfPayments:
                                                    plan.paymentsPlan?.length ??
                                                        0,
                                                isSelected: _selectedPlan?.id ==
                                                    plan.id,
                                                onPressed: (planId) {
                                                  setState(() {
                                                    _selectedPlan =
                                                        _paymentsPlan
                                                            ?.singleWhere(
                                                                (element) =>
                                                                    element
                                                                        .id ==
                                                                    planId);
                                                  });
                                                })
                                          ],
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 27, bottom: 37),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (_selectedPlan != null) ...[
                                            for (var i = 0;
                                                i <
                                                    (_selectedPlan!.paymentsPlan
                                                            ?.length ??
                                                        0);
                                                i++) ...[
                                              PaymentsPlanDateWidget(
                                                  onPressed: () {
                                                    showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          _selectedPlan!
                                                              .paymentsPlan![i]
                                                              .date!
                                                              .toDate(),
                                                      firstDate: widget
                                                          .mainViewActions
                                                          .getEarliestDateInPlan(
                                                              _selectedPlan!,
                                                              i),
                                                      lastDate: widget
                                                          .mainViewActions
                                                          .getLatestDateInPlan(
                                                              _selectedPlan!,
                                                              i),
                                                    ).then((date) {
                                                      if (date != null) {
                                                        debugPrint(
                                                            'datepicker result1 '
                                                            '${_selectedPlan!.paymentsPlan![i]}, '
                                                            '$date, '
                                                            '${date.toPlanDateFormat()}');
                                                        setState(() {
                                                          _selectedPlan!
                                                                  .paymentsPlan![i]
                                                                  .date =
                                                              date.toPlanDateFormat();
                                                        });
                                                        debugPrint(
                                                            'datepicker result2 '
                                                            '${_selectedPlan!.paymentsPlan![i]}');
                                                      }
                                                    });
                                                  },
                                                  amount: widget.mainViewActions
                                                      .getAmountDollars(
                                                          _selectedPlan
                                                                  ?.paymentsPlan?[
                                                                      i]
                                                                  .amount ??
                                                              0),
                                                  currency: widget
                                                      .mainViewActions
                                                      .getCurrency(),
                                                  date: _selectedPlan
                                                          ?.paymentsPlan?[i]
                                                          .date ??
                                                      DateTime.now()
                                                          .toIso8601String(),
                                                  isFirst: i == 0,
                                                  isLast: i ==
                                                      (_selectedPlan
                                                                  ?.paymentsPlan
                                                                  ?.length ??
                                                              0) -
                                                          1),
                                            ],
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 91, right: 35, left: 35),
                                  child: MainActionButtonWidget(
                                      onPressed: _selectedPlan != null? () =>
                                          widget.mainViewActions.splitRent(context, _selectedPlan!) : null))
                            ],
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              ),
            ),
            if (_showLoading) ...[
              const LoadingWidget(),
            ]
          ],
        ),
      ),
    );
  }

  void showLoading({bool show = true}) {
    setState(() {
      _showLoading = show;
    });
  }
}
