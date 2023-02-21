import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_home_assignment/views/main/bloc/main_view_bloc.dart';
import 'package:frontend_home_assignment/data/repositories/repository_provider.dart';
import 'package:frontend_home_assignment/views/main/view/main_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/payments/api/payments_api.dart';
import 'views/main/logic/main_view_actions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      home: BlocProvider(
          create: (_) => MainViewBloc(
                paymentsRepository:
                    getPaymentsRepository(paymentsApi: PaymentsApiImpl()),
              ),
          child: MainView(
            mainViewActions: MainViewActionsImpl(),
          )),
    ),
  );
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: const ColorScheme.light(
        background: Color(0xffF5F5F5),
      ));

  return baseTheme.copyWith(
    textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
