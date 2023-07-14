import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/repositories/system/system_respository.dart';
import 'package:worldline_flutter/env/env.dart';
import 'package:worldline_flutter/ui/navigation/main_navigator.dart';
import 'package:worldline_flutter/ui/viewmodels/root_viewmodel.dart';

@Injectable()
class SplashViewModel extends RootViewModel<SplashViewState> {
  final _systemRepository = getIt<SystemRepository>();

  MainNavigator get navigator => getIt<MainNavigator>();

  SplashViewModel() : super(Loading());

  @override
  void onAttach() async {
    final response = await _systemRepository.get();
    response.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(right)),
    );

    if (response.isRight) {
      redirect();
    }
  }

  void redirect() {
    navigator.navigateToHome();
  }
}

sealed class SplashViewState extends ViewState {}

class Loading extends SplashViewState {}

class Success extends SplashViewState {
  final Env env;

  Success(this.env);
}

class Error extends SplashViewState {
  final MainError error;

  Error(this.error);
}
