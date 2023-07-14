import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/models/example/example.dart';
import 'package:worldline_flutter/domain/repositories/example/example_repository.dart';
import 'package:worldline_flutter/ui/navigation/main_navigator.dart';
import 'package:worldline_flutter/ui/viewmodels/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  final _exampleRepository = getIt<ExampleRepository>();

  MainNavigator get navigator => getIt<MainNavigator>();

  HomeViewModel() : super(Loading());

  @override
  void onAttach() async {
    final response = await _exampleRepository.get();
    response.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(list: right)),
    );
  }
}

sealed class HomeViewState extends ViewState {}

class Loading extends HomeViewState {}

class Success extends HomeViewState {
  final List<Example> list;

  Success({required this.list});
}

class Error extends HomeViewState {
  final MainError error;

  Error(this.error);
}