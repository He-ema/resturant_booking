import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/welcome/presentation/managers/sheet_cubit/bottom_sheet_cubit.dart';
import 'package:jobizz/features/welcome/presentation/views/widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BottomSheetCubit(),
        child: const WelcomeViewBody(),
      ),
    );
  }
}
