import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RootViewModel<T extends ViewState> extends Cubit<T> {
  RootViewModel(super.initialState) {
    onAttach();
  }

  void emitValue(T state) {
    super.emit(state);
  }

  void onAttach();
}

abstract class ViewState {
  const ViewState();
}
