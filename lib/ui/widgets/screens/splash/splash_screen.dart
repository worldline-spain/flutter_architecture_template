import 'package:flutter/material.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/ui/viewmodels/splash/splash_viewmodel.dart';
import 'package:worldline_flutter/ui/widgets/components/error_card.dart';
import 'package:worldline_flutter/ui/widgets/screens/root_screen.dart';

class SplashScreen extends RootScreen<SplashViewState> {
  const SplashScreen({super.key});

  @override
  SplashViewModel get viewModel => getIt<SplashViewModel>();

  @override
  Widget buildView(BuildContext context, SplashViewState state) {
    return Scaffold(
      body: Center(
        child: switch (state) {
          Loading _ => Image.asset('assets/images/splash.png'),
          Success _ => Image.asset('assets/images/splash.png'),
          Error _ => ErrorCard(error: state.error),
        },
      ),
    );
  }
}
