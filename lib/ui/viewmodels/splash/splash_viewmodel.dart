import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/repositories/system/system_respository.dart';
import 'package:worldline_flutter/env/env.dart';
import 'package:worldline_flutter/ui/navigation/main_navigator.dart';
import 'package:worldline_flutter/ui/viewmodels/root_viewmodel.dart';

@Injectable()
class SplashViewModel extends RootViewModel<SplashViewState> {
  final SystemRepository systemRepository;
  final MainNavigator navigator;

  SplashViewModel({
    required this.navigator,
    required this.systemRepository,
  }) : super(const Loading());

  @override
  void onAttach() async {
    final response = await systemRepository.get();
    response.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(right)),
    );
    FlutterNativeSplash.remove();

    if (response.isRight) {
      redirect();
    }
  }

  void redirect() {
    navigator.navigateToHome(title: 'home.title'.tr());
  }
}

sealed class SplashViewState extends ViewState {
  const SplashViewState();
}

class Loading extends SplashViewState {
  const Loading();
}

class Success extends SplashViewState {
  final Env env;

  const Success(this.env);
}

class Error extends SplashViewState {
  final MainError error;

  const Error(this.error);
}
