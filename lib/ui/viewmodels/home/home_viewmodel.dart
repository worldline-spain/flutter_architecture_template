import 'package:injectable/injectable.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/domain/models/example/example.dart';
import 'package:worldline_flutter/domain/repositories/example/example_repository.dart';
import 'package:worldline_flutter/ui/navigation/main_navigator.dart';
import 'package:worldline_flutter/ui/viewmodels/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  final ExampleRepository exampleRepository;
  final MainNavigator navigator;

  HomeViewModel(
    this.navigator,
    this.exampleRepository,
  ) : super(const Loading());

  @override
  void onAttach() async {
    final response = await exampleRepository.get();
    response.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(list: right)),
    );
  }

  void navigateToDetail() {
    navigator.navigateToDetail();
  }
}

sealed class HomeViewState extends ViewState {
  const HomeViewState();
}

class Loading extends HomeViewState {
  const Loading();
}

class Success extends HomeViewState {
  final List<Example> list;

  const Success({required this.list});
}

class Error extends HomeViewState {
  final MainError error;

  const Error(this.error);
}
