import 'package:flutter/material.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/ui/viewmodels/splash/splash_viewmodel.dart';
import 'package:worldline_flutter/ui/widgets/components/error_card.dart';
import 'package:worldline_flutter/ui/widgets/components/loading_circle.dart';
import 'package:worldline_flutter/ui/widgets/screens/root_screen.dart';

class SplashScreen extends RootScreen<SplashViewState> {
  const SplashScreen({super.key});

  @override
  SplashViewModel get viewModel => getIt<SplashViewModel>();

  @override
  Widget buildView(BuildContext context, SplashViewState state) {
    return Scaffold(
      body: SafeArea(
        child: switch (state) {
          Loading _ => const LoadingCircle(),
          Success _ => const Placeholder(),
          Error _ => ErrorCard(error: state.error),
        },
      ),
    );
  }
}
